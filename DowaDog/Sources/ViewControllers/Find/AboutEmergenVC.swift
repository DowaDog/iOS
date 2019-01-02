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
  
    @IBOutlet weak var phoneNumb: UIButton!
    var numb : String!
    var heart: UIBarButtonItem!
    //bottomC:178
    //top: 650
    //popup height : 175
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackBtn()

         heart = UIBarButtonItem(image:UIImage(named: "heartBtnLine.png") , style: .plain, target: self, action: #selector(heartTapped))
        heart.tintColor = UIColor.white
        
        navigationItem.rightBarButtonItems = [heart]

      
    }
    
    @objc func heartTapped(){
        if heartClcik == false{
              heart.image = UIImage(named: "heartBtnFill")
            heartClcik = true
        }else{
            heart.image = UIImage(named: "heartBtnLine.png")
            heartClcik = false
        }
      
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

