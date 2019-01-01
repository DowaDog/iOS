//
//  AboutEmergenVC.swift
//  DowaDog
//
//  Created by 조윤영 on 30/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit

class AboutEmergenVC: UIViewController {
    var heartClcik = false
    @IBOutlet weak var popupView: RoundView!
    @IBOutlet weak var phoneNumb: UIButton!
    var numb : String!
    
    @IBOutlet weak var bottomC: NSLayoutConstraint!
    @IBOutlet weak var topC: NSLayoutConstraint!
    //bottomC:178
    //top: 650
    //popup height : 175
    
    @IBOutlet weak var blackScreen: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackBtn()
        self.popupView.sectionRound()
        setBlackScreen()
        

        
//       self.popupView.isHidden = true
        
        let share = UIBarButtonItem(image:UIImage(named: "shareBtn.png") , style: .plain, target: self, action: #selector(shareTapped))
        share.tintColor = UIColor.white
        
        let heart = UIBarButtonItem(image:UIImage(named: "heartBtnLine.png") , style: .plain, target: self, action: #selector(heartTapped))
        heart.tintColor = UIColor.white
        
        navigationItem.rightBarButtonItems = [heart, share]

      
    }
    
    @objc func shareTapped() {
        topC.constant = 424
        bottomC.constant = 404
        self.blackScreen.isHidden = false
        UIView.animate(withDuration: 0.4, animations: {
            self.blackScreen.alpha = 1
        })
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (animationComplete) in
            print("The animation is complete!")
        }
    }

    
    @objc func heartTapped(){
        
    }
    

    
    // init BlackScreen
    func setBlackScreen() {
        blackScreen.isHidden = true
        blackScreen.backgroundColor = UIColor(white: 0, alpha: 0.5)
//        self.navigationController?.view.addSubview(blackScreen)
       
        let tapGestRecognizer = UITapGestureRecognizer(target: self, action: #selector(blackScreenTapAction(sender:)))
        blackScreen.addGestureRecognizer(tapGestRecognizer)
    }
    @objc func blackScreenTapAction(sender: UITapGestureRecognizer) {
        //bottomC:178
        //top: 650
        //popup height : 175
        bottomC.constant = 178
        topC.constant = 650
        
        self.blackScreen.isHidden = true
        UIView.animate(withDuration: 0.4, animations: {
            self.blackScreen.alpha = 0
        })
    }
    
    
    @IBAction func callAction(_ sender: Any) {
        
        guard let number = URL(string: "tel://" + "01056472489") else { return }
        UIApplication.shared.open(number)

        //이거 실제 디바이스에서는 되는지 승언 오빠 핸드폰으로 확인하기
        //데이터 받아올 때 -나 스페이스 제외해서 넣기
        

    }
    private func callNumber(phoneNumber:String) {
        
        if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
            
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        }
    }
    
    @IBAction func kakaoLinkAction(_ sender: Any) {
        
        // Feed 타입 템플릿 오브젝트 생성
        let template = KMTFeedTemplate { (feedTemplateBuilder) in
            
            // 컨텐츠
            feedTemplateBuilder.content = KMTContentObject(builderBlock: { (contentBuilder) in
                contentBuilder.title = "제 이야기를 들어볼래요?"
                contentBuilder.desc = "사람을 좋아해서 활발하고 밝은 성격이에요!"
                contentBuilder.imageURL = URL(string: "http://mud-kage.kakao.co.kr/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png")!
                //여따가 이미지 서버에서 불러와서 넣기
                
                contentBuilder.link = KMTLinkObject(builderBlock: { (linkBuilder) in
                    linkBuilder.mobileWebURL = URL(string: "https://developers.kakao.com")
                })
            })
            
            // 소셜
            //            feedTemplateBuilder.social = KMTSocialObject(builderBlock: { (socialBuilder) in
            //                socialBuilder.likeCount = 286
            //                socialBuilder.commnentCount = 45
            //                socialBuilder.sharedCount = 845
            //            })
            
            // 버튼
            feedTemplateBuilder.addButton(KMTButtonObject(builderBlock: { (buttonBuilder) in
                buttonBuilder.title = "앱으로 보기"
                buttonBuilder.link = KMTLinkObject(builderBlock: { (linkBuilder) in
                    linkBuilder.iosExecutionParams = "param1=value1&param2=value2"
                    linkBuilder.androidExecutionParams = "param1=value1&param2=value2"
                })
            }))
        }
        
        // 서버에서 콜백으로 받을 정보
        let serverCallbackArgs = ["user_id": "abcd",
                                  "product_id": "1234"]
        
        // 카카오링크 실행
        KLKTalkLinkCenter.shared().sendDefault(with: template, serverCallbackArgs: serverCallbackArgs, success: { (warningMsg, argumentMsg) in
            
            // 성공
            print("warning message: \(String(describing: warningMsg))")
            print("argument message: \(String(describing: argumentMsg))")
            
        }, failure: { (error) in
            
            // 실패
            UIAlertController.showMessage(error.localizedDescription)
            print("error \(error)")
            
        })
        
    }
    }

extension UIAlertController {
    
    static func showMessage(_ message: String) {
        showAlert(title: "", message: message, actions: [UIAlertAction(title: "OK", style: .cancel, handler: nil)])
    }
    
    static func showAlert(title: String?, message: String?, actions: [UIAlertAction]) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            for action in actions {
                alert.addAction(action)
            }
            if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController, let presenting = navigationController.topViewController {
                presenting.present(alert, animated: true, completion: nil)
            }
        }
    }
}

