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

    
    
    
    
    // Swipe
    @IBOutlet var upSwipe: UISwipeGestureRecognizer!
    @IBOutlet var downSwipe: UISwipeGestureRecognizer!
    @IBOutlet var leftSwipe: UISwipeGestureRecognizer!
    @IBOutlet var rightSwipe: UISwipeGestureRecognizer!
    

    
    
    // GuidView
    @IBOutlet var guideView: UIView!
    @IBOutlet var guideImageView: UIImageView!
    @IBOutlet var guideIndicator: UIImageView!
    @IBOutlet var guideViewNextBtn: UIButton!
    let guideImageArray: Array<UIImage> = [
        UIImage(named: "325")!,
        UIImage(named: "324")!,
        UIImage(named: "323")!,
        UIImage(named: "322")!,
        UIImage(named: "321")!,
        UIImage(named: "320")!
    ]
    let guideIndicatorArray: Array<UIImage> = [
        UIImage(named: "popupOneIndicate")!,
        UIImage(named: "popupTwoIndicate")!,
        UIImage(named: "popupThreeIndicate")!,
        UIImage(named: "popupFourIndicate")!,
        UIImage(named: "popupFiveIndicate")!,
        UIImage(named: "popupSixIndicate")!
    ]
    @IBOutlet var blackScreen2: UIView!
    
    
    
    
    // cardView
    @IBOutlet var cardView: UIImageView!
    @IBOutlet var stateImageView: UIImageView!
    let stateImageArray: Array<UIImage> = [
        UIImage(named: "mainSlideNonadoptImg")!,
        UIImage(named: "mainSlideFailImg")!,
        UIImage(named: "mainSlide1StepImg")!,
        UIImage(named: "mainSlide2StepImg")!,
        UIImage(named: "mainSlide3StepImg")!,
        UIImage(named: "mainSlide4StepImg")!,
        UIImage(named: "mainSlide5StepImg")!
    ]
    
    
    @IBOutlet var sideMenuView: UIView!
    var blackScreen: UIView!
    
    
    
    
    
    @IBOutlet var newFamBtn: UIButton!
    
    @IBOutlet var new: UIImageView!
    
    

    
    
    
    


    
    // flag
    var newFlag: Bool?                                                              // 카드뷰 new indicator
    var state: Array<String> = ["NO", "S0", "S1", "S2", "S3", "COMPLETE", "DENY"]   // 카드뷰 state Array
    
    
    
    var guideState: Int = 0                 // 가이드뷰 스테이트
    var guideViewFlag: Bool = false         // 가이드뷰 확인
    var blackFlag: Bool = false             // 
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNavigationBarShadow()
        
        upSwipe.direction = .up
        downSwipe.direction = .down
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        
        setBlackScreen()
        setBlackScreen2()
        setSideMenu()
        setGuideView()
        setCardView()



        if guideViewFlag == false {
            cardView.alpha = 0
            new.alpha = 0
            showGuideView()
        } else {
            if newFlag == false {
                new.alpha = 1
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        HomeService.shared.getHome() {
            (data) in
            
            print("data: =========================")
            print(data)
            print("data: =========================")
            
            
            self.newFlag = self.gbno(data.data?.userCheck)
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    func setGuideView() {
        guideView.layer.cornerRadius = 15
        guideViewNextBtn.roundedButton()
        guideImageView.image = guideImageArray[guideState]
    }
    
    func showGuideView() {
        UIView.animate(withDuration: 0.3, animations: {
            
            self.navigationController?.navigationBar.layer.zPosition = -1
            
            self.blackFlag = true
            self.blackScreen2.alpha = 1
            self.guideView.alpha = 1

            self.view.layoutIfNeeded()
        })
    }

    func hideGuideView() {
        UIView.animate(withDuration: 0.3, animations: {
            
            self.navigationController?.navigationBar.layer.zPosition = 1
            
            self.blackFlag = false
            self.blackScreen2.alpha = 0
            self.guideView.alpha = 0
            self.guideViewFlag = true

            self.view.layoutIfNeeded()
        })
    }
    
    @IBAction func menuTapped(_ sender: Any) {
        if blackFlag != true {
            showMenu()
        }
    }
    
    @IBAction func xBtnAction(_ sender: Any) {
        hideMenu()
    }
    
    @objc func blackScreenTapAction(sender: UITapGestureRecognizer) {
        hideMenu()
    }
    
    @objc func blackScreen2TapAction(sender: UITapGestureRecognizer) {
        if guideViewFlag == true {
            hideCardView()
        }
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
                hideMenu()
                
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
    
    
    
    
    
    
    
    
    
    
    // 카드뷰 스와이프
    @IBAction func upSwipeAction(_ sender: UISwipeGestureRecognizer) {

        HomeService.shared.getNews() {
            (data) in
            
            print("data: =========================")
            print(data)
            print("data: =========================")
        }
        
        UIView.animate(withDuration: 0.3, animations: {
            
            self.new.isHidden = true
            
            self.blackFlag = true
            self.stateImageView.image = self.stateImageArray[self.state]
            self.stateImageView.alpha = 1
            self.navigationController?.navigationBar.layer.zPosition = -1


            self.blackScreen2.alpha = 1
            self.cardViewConstraint.constant = -8
            print("up")

            self.view.layoutIfNeeded()
        })
    }
    // 카드뷰 스와이프
    @IBAction func downSwipeAction(_ sender: UISwipeGestureRecognizer) {

        
        
        UIView.animate(withDuration: 0.3, animations: {
            self.navigationController?.navigationBar.layer.zPosition = 1

            self.blackFlag = false
            self.stateImageView.alpha = 0
            self.blackScreen2.alpha = 0
            self.cardViewConstraint.constant = -428
            print("down")

            self.view.layoutIfNeeded()
        })
    }
    func hideCardView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.navigationController?.navigationBar.layer.zPosition = 1
            
            self.blackScreen2.alpha = 0
            self.cardViewConstraint.constant = -428
            self.view.layoutIfNeeded()
        })
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // 가이드뷰 스와이프 액션
    @IBAction func leftSwipeAction(_ sender: UISwipeGestureRecognizer) {

        if guideState < 5 {
            guideState += 1

            self.guideImageView.alpha = 0
            self.guideImageView.image = self.guideImageArray[self.guideState]
            self.guideIndicator.image = self.guideIndicatorArray[self.guideState]
            UIView.animate(withDuration: 0.5, animations: {
                self.guideImageView.alpha = 1

                self.view.layoutIfNeeded()
            })

            if guideState == 5 {
                guideViewNextBtn.setTitle("시작할개요", for: .normal)
                guideViewNextBtn.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0), for: .normal)
                guideViewNextBtn.backgroundColor = UIColor(red: 255/255, green: 194/255, blue: 51/255, alpha: 1.0)
            }
        } else {
            hideGuideView()
            UIView.animate(withDuration: 0.5, animations: {
                self.cardView.alpha = 1
                self.new.alpha = 1
            })
        }
    }
    // 가이드뷰 스와이프 액션
    @IBAction func rightSwipeAction(_ sender: UISwipeGestureRecognizer) {

        if guideState > 0 {
            guideState -= 1

            self.guideImageView.alpha = 0
            self.guideImageView.image = self.guideImageArray[self.guideState]
            self.guideIndicator.image = self.guideIndicatorArray[self.guideState]
            UIView.animate(withDuration: 0.5, animations: {
                self.guideImageView.alpha = 1

                self.view.layoutIfNeeded()
            })

            if guideState < 5 {
                guideViewNextBtn.setTitle("다음으로", for: .normal)
                guideViewNextBtn.setTitleColor(UIColor(red: 255/255, green: 194/255, blue: 51/255, alpha: 1.0), for: .normal)
                guideViewNextBtn.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
            }
        }
    }
    // 가이드 뷰 액션
    @IBAction func guideViewNextBtnAction(_ sender: UIButton) {

        if guideState < 5 {
            guideState += 1

            self.guideImageView.alpha = 0
            self.guideImageView.image = self.guideImageArray[self.guideState]
            self.guideIndicator.image = self.guideIndicatorArray[self.guideState]
            UIView.animate(withDuration: 0.5, animations: {
                self.guideImageView.alpha = 1
                
                self.view.layoutIfNeeded()
            })
            
            if guideState == 5 {
                sender.setTitle("시작할개요", for: .normal)
                guideViewNextBtn.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0), for: .normal)
                guideViewNextBtn.backgroundColor = UIColor(red: 255/255, green: 194/255, blue: 51/255, alpha: 1.0)
            }
        } else {
            hideGuideView()
            UIView.animate(withDuration: 0.5, animations: {
                self.cardView.alpha = 1
                self.new.alpha = 1
            })
        }
    }
    
    
    
    
    
    
    //unwind Point
    @IBAction func unwindAction(_ sender: UIStoryboardSegue) {}
}
















// 가이드뷰 하단 모서리 둥글게 설정
extension UIButton {
    func roundedButton(){
        let maskPath1 = UIBezierPath(
                roundedRect: bounds,
                byRoundingCorners: [.bottomLeft , .bottomRight],
                cornerRadii: CGSize(width: 15, height: 15)
        )

        let maskLayer1 = CAShapeLayer()

        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
}
