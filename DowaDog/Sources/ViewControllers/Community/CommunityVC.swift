//
//  CommunityVC.swift
//  DowaDog
//
//  Created by wookeon on 29/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit

class CommunityVC: UIViewController {
    
    
    var communityList = [Community<CommunityImgList>]()

    @IBOutlet var communityTableView: UITableView!
    
    // sidemenu
    var blackScreen: UIView!
    @IBOutlet var sideMenuView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.setNavigationBarShadow()

        
        // sidemenu
        setBlackScreen()
        setSideMenu()
        
//        communityTableView.delegate = self
//        communityTableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        CommunityListService.shared.getCommunityList(page: 0, limit: 10) {[weak self]
            (data) in
            guard let `self` = self else {return}

            self.communityList = data
            
            
            print("data================")
            print(data)
            print("data================")

            self.communityTableView.reloadData()
        }
    }
    
    
    
    
    // sidemenu
    func setSideMenu() {
        sideMenuView.frame = UIApplication.shared.keyWindow!.frame
        UIApplication.shared.keyWindow!.addSubview(sideMenuView)
        
        self.sideMenuView.transform = CGAffineTransform(translationX: -self.sideMenuView.frame.width, y: 0)
    }
    
    func setBlackScreen() {
        blackScreen=UIView(frame: self.view.bounds)
        blackScreen.alpha = 0
        blackScreen.backgroundColor = UIColor(white: 0, alpha: 0.5)
        self.navigationController?.view.addSubview(blackScreen)
        let tapGestRecognizer = UITapGestureRecognizer(target: self, action: #selector(blackScreenTapAction(sender:)))
        blackScreen.addGestureRecognizer(tapGestRecognizer)
    }
    
    @IBAction func menuTapped(_ sender: Any) {
        showMenu()
    }
    
    @IBAction func xBtnAction(_ sender: Any) {
        hideMenu()
    }
    
    
    @objc func blackScreenTapAction(sender: UITapGestureRecognizer) {
        hideMenu()
    }
    
    func showMenu() {
        UIView.animate(withDuration: 0.4, animations: {
            self.blackScreen.alpha = 1
        })
        
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
            self.sideMenuView.transform = .identity
        })
    }
    func hideMenu() {
        UIView.animate(withDuration: 0.4, animations: {
            self.blackScreen.alpha = 0
        })
        
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
            self.sideMenuView.transform = CGAffineTransform(translationX: -self.sideMenuView.frame.width, y: 0)
        })
    }
    
    @IBAction func sideNavBtnAction(_ sender: UIButton) {
        
        if let btnTitle = sender.titleLabel?.text {
            switch (btnTitle) {
            case "홈":
                hideMenu()
                
                break
            case "기다릴개 란?":
                hideMenu()
                
                let info = UIStoryboard(name: "Info", bundle: nil).instantiateViewController(withIdentifier: "InfoNav") as! UINavigationController
                
                self.present(info, animated: true, completion: nil)
                
                break
            case "입양하기":
                hideMenu()
                
                let adopt = UIStoryboard(name: "Adopt", bundle: nil).instantiateViewController(withIdentifier: "AdoptNav") as! UINavigationController
                
                self.present(adopt, animated: true, completion: nil)
                
                break
            case "커뮤니티":
                hideMenu()
                
                let community = UIStoryboard(name: "Community", bundle: nil).instantiateViewController(withIdentifier: "CommunityNav") as! UINavigationController
                
                self.present(community, animated: true, completion: nil)
                break
            case "컨텐츠":
                print("Contents")
                break
            case "마이페이지":
                print("MyPage")
                break
            case "입양 안내":
                print("Guide")
                break
            default:
                print("Default")
                break
            }
        }
    }
    
    
    
    @IBAction func writeBtnAction(_ sender: UIButton) {
        performSegue(withIdentifier: "goCommunityWriteVC", sender: self)
    }
    
}



//extension CommunityVC : UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return communityList.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cellOne = communityTableView.dequeueReusableCell(withIdentifier: "OneTVC") as! CommunityOneTVC
//        let cellTwo = communityTableView.dequeueReusableCell(withIdentifier: "TwoTVC") as! CommunityTwoTVC
//        let cellThree = communityTableView.dequeueReusableCell(withIdentifier: "ThreeTVC") as! CommunityThreeTVC
//        let cellFour = communityTableView.dequeueReusableCell(withIdentifier: "FourTVC") as! CommunityFourTVC
//
//
////        let board = boardList[indexPath.row]
////
////        let dateFormatter = DateFormatter()
////        dateFormatter.dateFormat = "MM/dd hh:mm"
////
////        cell.imgView.imageFromUrl(gsno(board.boardPhoto), defaultImgPath: "")
////        cell.titleLabel.text = board.boardTitle
////        cell.contentsLabel.text = board.boardContents
////        cell.dateLabel.text = dateFormatter.string(from: board.boardDate ?? Date())
////        cell.likeLabel.text = "좋아요 " + String(board.boardLike!) + "개"
////        cell.nameLabel.text = String(board.userId!)
//
//        return cellOne
//    }
//}
//
//extension CommunityVC: UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailBoardVC") as! DetailBoardVC
//
//        let board = boardList[indexPath.row]
//
//        detailVC.detailBoardId = board.boardId
//
//        navigationController?.pushViewController(detailVC, animated: true)
//    }
//}
