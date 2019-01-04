//
//  HomeVC.swift
//  DowaDog
//
//  Created by wookeon on 27/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
 
    // 0 -> -428
    @IBOutlet var cardViewConstraint: NSLayoutConstraint!

    @IBOutlet var blackScreen2: UIView!
    
    @IBOutlet var upSwipe: UISwipeGestureRecognizer!
    @IBOutlet var downSwipe: UISwipeGestureRecognizer!

    @IBOutlet var cardView: UIImageView!

    @IBOutlet var sideMenuView: UIView!
    var blackScreen: UIView!
    
    @IBOutlet var newFamBtn: UIButton!
    
    @IBOutlet var new: UIImageView!
    @IBOutlet var stateImageView: UIImageView!
    
    let stateImageArray: [UIImage] = [
        UIImage(named: "mainSlideNonadoptImg")!,
        UIImage(named: "mainSlideFailImg")!,
        UIImage(named: "mainSlide1StepImg")!,
        UIImage(named: "mainSlide2StepImg")!,
        UIImage(named: "mainSlide3StepImg")!,
        UIImage(named: "mainSlide4StepImg")!,
        UIImage(named: "mainSlide5StepImg")!
        ]
    
    // flag
    var newFlag: Bool = true
    var state: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNavigationBarShadow()
        newFamBtn.layer.cornerRadius = newFamBtn.layer.frame.height/2
        
        upSwipe.direction = .up
        downSwipe.direction = .down
        
        setBlackScreen()
        setBlackScreen2()
        setSideMenu()
        
        setCardView()
        
        
        if newFlag == true {
            new.isHidden = false
        }
        
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
    
    @objc func blackScreen2TapAction(sender: UITapGestureRecognizer) {
        hideCardView()
    }
    
    func setCardView() {
        cardViewConstraint.constant = -428
    }
    
    func setBlackScreen2() {
        let tapGestRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(blackScreen2TapAction(sender:)))
        blackScreen2.addGestureRecognizer(tapGestRecognizer2)
    }
    
    // sideMenu 를 뷰 최상단으로 지정
    func setSideMenu() {
        sideMenuView.frame = UIApplication.shared.keyWindow!.frame
        UIApplication.shared.keyWindow!.addSubview(sideMenuView)
        
        self.sideMenuView.transform = CGAffineTransform(translationX: -self.sideMenuView.frame.width, y: 0)
    }
    
    // init BlackScreen
    func setBlackScreen() {
        blackScreen=UIView(frame: self.view.bounds)
        blackScreen.alpha = 0
        blackScreen.backgroundColor = UIColor(white: 0, alpha: 0.5)
        self.navigationController?.view.addSubview(blackScreen)
        let tapGestRecognizer = UITapGestureRecognizer(target: self, action: #selector(blackScreenTapAction(sender:)))
        blackScreen.addGestureRecognizer(tapGestRecognizer)
    }

    // Open sideMenu
    func showMenu() {
        UIView.animate(withDuration: 0.4, animations: {
            self.blackScreen.alpha = 1
        })
        
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
            self.sideMenuView.transform = .identity
        })
    }
    
    func hideCardView() {
        
        
        UIView.animate(withDuration: 0.3, animations: {
            self.navigationController?.navigationBar.layer.zPosition = 1
            
            self.blackScreen2.alpha = 0
            self.cardViewConstraint.constant = -428
            print("down")
            
            self.view.layoutIfNeeded()
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
    
    @IBAction func upSwipeAction(_ sender: UISwipeGestureRecognizer) {

        
        
        UIView.animate(withDuration: 0.3, animations: {
            
            self.new.isHidden = true
            
            self.stateImageView.image = self.stateImageArray[self.state]
            self.stateImageView.alpha = 1
            self.navigationController?.navigationBar.layer.zPosition = -1


            self.blackScreen2.alpha = 1
            self.cardViewConstraint.constant = 0
            print("up")

            self.view.layoutIfNeeded()
        })
    }
    
    @IBAction func downSwipeAction(_ sender: UISwipeGestureRecognizer) {

        
        
        UIView.animate(withDuration: 0.3, animations: {
            self.navigationController?.navigationBar.layer.zPosition = 1

            self.stateImageView.alpha = 0

            self.blackScreen2.alpha = 0
            self.cardViewConstraint.constant = -428
            print("down")

            self.view.layoutIfNeeded()
        })
    }
    
    
    //unwind Point
    @IBAction func unwindAction(_ sender: UIStoryboardSegue) {
        
    }
}
