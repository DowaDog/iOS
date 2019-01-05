//
//  MainPageVC.swift
//  DowaDog
//
//  Created by 조윤영 on 30/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit

class MainPageVC: UIViewController {
    
    
    @IBOutlet weak var page1CV: UIView!
    @IBOutlet weak var page2CV: UIView!
    
    
   
    @IBOutlet weak var selectPoint1: UIView!
    
    @IBOutlet weak var selectPoint2: UIView!
    
    
    @IBOutlet weak var leadingC: NSLayoutConstraint!
    @IBOutlet weak var trailingC: NSLayoutConstraint!
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var tab1: UIButton!
    
    @IBOutlet weak var tab2: UIButton!
    


    @IBOutlet var sideMenuView: UIView!
    var blackScreen: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNavigationBarShadow()

        navBarTintColor = UIColor.init(displayP3Red: 111/255, green: 111/255, blue: 111/255, alpha: 1) 
        page2CV.alpha = 0.0
        self.selectPoint1.alpha = 1.0
           self.selectPoint2.alpha = 0.0
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



    
    @IBAction func FirstPageAction(_ sender: Any) {
        
        UIView.animate(withDuration: 0.2, animations:{ self.selectPoint1.alpha = 1.0
            self.selectPoint2.alpha = 0.0
            
            
            self.tab2.setTitleColor(UIColor(red: 154.0/255.0, green: 154.0/255.0, blue: 154.0/255.0, alpha: 1.0), for: .normal)
            self.tab1.setTitleColor(UIColor.init(red: 255/255, green: 194/255, blue: 51/255, alpha: 1), for: .normal)
        
        })

        self.page1CV.alpha = 1.0
        self.page2CV.alpha = 0.0

    }
    
    
    @IBAction func SecondPageAction(_ sender: Any) {
        
        
        UIView.animate(withDuration: 0.2, animations:{ self.selectPoint1.alpha = 0.0
            self.selectPoint2.alpha = 1.0
            self.tab2.setTitleColor(UIColor.init(red: 255/255, green: 194/255, blue: 51/255, alpha: 1), for: .normal)
            self.tab1.setTitleColor(UIColor(red: 154.0/255.0, green: 154.0/255.0, blue: 154.0/255.0, alpha: 1.0), for: .normal)

        })
        
        self.page1CV.alpha = 0.0
        self.page2CV.alpha = 1.0
        
    }
    
    
    
}
