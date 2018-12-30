//
//  HomeVC.swift
//  DowaDog
//
//  Created by wookeon on 27/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
 
    
    @IBOutlet var sideMenuView: UIView!
    var blackScreen: UIView!
    
    @IBOutlet var newFamBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNavigationBarShadow()
        newFamBtn.layer.cornerRadius = newFamBtn.layer.frame.height/2
        
        setBlackScreen()
        hideMenu()
        setSideMenu()
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
    
    // sideMenu 를 뷰 최상단으로 지정
    func setSideMenu() {
        sideMenuView.frame = UIApplication.shared.keyWindow!.frame
        UIApplication.shared.keyWindow!.addSubview(sideMenuView)
    }
    
    // init BlackScreen
    func setBlackScreen() {
        blackScreen=UIView(frame: self.view.bounds)
        blackScreen.isHidden = true
        blackScreen.backgroundColor = UIColor(white: 0, alpha: 0.5)
        self.navigationController?.view.addSubview(blackScreen)
        let tapGestRecognizer = UITapGestureRecognizer(target: self, action: #selector(blackScreenTapAction(sender:)))
        blackScreen.addGestureRecognizer(tapGestRecognizer)
    }

    // Open sideMenu
    func showMenu() {
        self.sideMenuView.isHidden = false
        self.blackScreen.isHidden = false
        UIView.animate(withDuration: 0.4, animations: {
            self.blackScreen.alpha = 1
        })
        
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
            self.sideMenuView.transform = .identity
        })
    }
    
    // Close sideMenu
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
                print("Home")
                break
            case "기다릴 개란?":
                print("Infomation")
                break
            case "입양하기":
                print("Adopt")
                break
            case "커뮤니티":
                hideMenu()
//                sideMenuView.isHidden = true
                
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
}
