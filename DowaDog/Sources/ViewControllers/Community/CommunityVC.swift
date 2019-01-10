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
        
        communityTableView.dataSource = self
        
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

                performSegue(withIdentifier: "unwindToHome", sender: self)
                
                break
            case "기다릴개 란?":
                hideMenu()
                
                let info = UIStoryboard(name: "Info", bundle: nil).instantiateViewController(withIdentifier: "InfoNav") as! UINavigationController
                
                self.present(info, animated: true, completion: nil)
                
                break
            case "입양하기":
                hideMenu()
                
                let finding = UIStoryboard(name: "Finding", bundle: nil).instantiateViewController(withIdentifier: "FindingNav") as! UINavigationController
                
                self.present(finding, animated: true, completion: nil)
                
                break
            case "커뮤니티":
                hideMenu()
                
                let community = UIStoryboard(name: "Community", bundle: nil).instantiateViewController(withIdentifier: "CommunityNav") as! UINavigationController
                
                self.present(community, animated: true, completion: nil)
                break
            case "컨텐츠":
                hideMenu()
                
                let contents = UIStoryboard(name: "Contents", bundle: nil).instantiateViewController(withIdentifier: "ContentsNav") as! UINavigationController
                
                self.present(contents, animated: true, completion: nil)
                break
            case "마이페이지":
                hideMenu()
                
                let myProfile = UIStoryboard(name: "MyProfile", bundle: nil).instantiateViewController(withIdentifier: "MyProfileNav") as! UINavigationController
                
                self.present(myProfile, animated: true, completion: nil)
                break
            case "기다릴개와 함께할개":
                hideMenu()
                
                let support = UIStoryboard(name: "Support", bundle: nil).instantiateViewController(withIdentifier: "SupportNav") as! UINavigationController
                
                self.present(support, animated: true, completion: nil)
                break
            default:
                hideMenu()
                break
            }
        }
    }
    
    @IBAction func writeBtnAction(_ sender: UIButton) {
        performSegue(withIdentifier: "goCommunityWriteVC", sender: self)
    }
    
}

extension CommunityVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return communityList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let oneTVC = communityTableView.dequeueReusableCell(withIdentifier: "OneTVC") as! CommunityOneTVC
        let twoTVC = communityTableView.dequeueReusableCell(withIdentifier: "TwoTVC") as! CommunityTwoTVC
        let threeTVC = communityTableView.dequeueReusableCell(withIdentifier: "ThreeTVC") as! CommunityThreeTVC
        let fourTVC = communityTableView.dequeueReusableCell(withIdentifier: "FourTVC") as! CommunityFourTVC
        
        let community = communityList[indexPath.row]
        
        let date = Date()
        
        
        print(date)
        print(date)
        print(date)
        print(date)
        print(date)
        print(date)
        
        
        switch (community.communityImgList?.count) {
        case 0:
            oneTVC.uploadImage1.image = UIImage(named: "communityNoimg")!
            oneTVC.title.text = community.title
            oneTVC.profileImage.imageFromUrl(gsno(community.userProfileImg), defaultImgPath: "")
            oneTVC.writeTime.text = "윤영아 수정해줘"
            oneTVC.userId.text = community.userId
            
            return oneTVC
        case 1:
            oneTVC.uploadImage1.imageFromUrl(gsno(community.communityImgList![0].filePath), defaultImgPath: "")
            oneTVC.title.text = community.title
            oneTVC.profileImage.imageFromUrl(gsno(community.userProfileImg), defaultImgPath: "")
            oneTVC.writeTime.text = "윤영아 수정해줘"
            oneTVC.userId.text = community.userId
            
            return oneTVC
        case 2:
            twoTVC.uploadImage1.imageFromUrl(gsno(community.communityImgList![0].filePath), defaultImgPath: "")
            twoTVC.uploadImage2.imageFromUrl(gsno(community.communityImgList![1].filePath), defaultImgPath: "")
            twoTVC.title.text = community.title
            twoTVC.profileImage.imageFromUrl(gsno(community.userProfileImg), defaultImgPath: "")
            twoTVC.writeTime.text = "윤영아 수정해줘"
            twoTVC.userId.text = community.userId
            
            return twoTVC
        case 3:
            threeTVC.uploadImage1.imageFromUrl(gsno(community.communityImgList![0].filePath), defaultImgPath: "")
            threeTVC.uploadImage2.imageFromUrl(gsno(community.communityImgList![1].filePath), defaultImgPath: "")
            threeTVC.uploadImage3.imageFromUrl(gsno(community.communityImgList![2].filePath), defaultImgPath: "")
            threeTVC.title.text = community.title
            threeTVC.profileImage.imageFromUrl(gsno(community.userProfileImg), defaultImgPath: "")
            threeTVC.writeTime.text = "윤영아 수정해줘"
            threeTVC.userId.text = community.userId
            
            return threeTVC
        case 4:
            fourTVC.uploadImage1.imageFromUrl(gsno(community.communityImgList![0].filePath), defaultImgPath: "")
            fourTVC.uploadImage2.imageFromUrl(gsno(community.communityImgList![1].filePath), defaultImgPath: "")
            fourTVC.uploadImage3.imageFromUrl(gsno(community.communityImgList![2].filePath), defaultImgPath: "")
            fourTVC.title.text = community.title
            fourTVC.profileImage.imageFromUrl(gsno(community.userProfileImg), defaultImgPath: "")
            fourTVC.writeTime.text = "윤영아 수정해줘"
            fourTVC.userId.text = community.userId
            
            return fourTVC
        default:
            oneTVC.uploadImage1.imageFromUrl(gsno(community.communityImgList![0].filePath), defaultImgPath: "")
            oneTVC.title.text = community.title
            oneTVC.profileImage.imageFromUrl(gsno(community.userProfileImg), defaultImgPath: "")
            oneTVC.writeTime.text = "윤영아 수정해줘"
            oneTVC.userId.text = community.userId
            
            return oneTVC
        }
    }
}
