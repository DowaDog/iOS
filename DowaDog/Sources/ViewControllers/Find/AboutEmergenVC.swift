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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackBtn()

        // Do any additional setup after loading the view.
      
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
    
    @IBAction func shareAction(_ sender: Any) {
        
    }
    
    @IBAction func heartAction(_ sender: Any) {
        
    }
}
