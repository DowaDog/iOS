//
//  AdoptDirectVC.swift
//  DowaDog
//
//  Created by wookeon on 03/01/2019.
//  Copyright © 2019 wookeon. All rights reserved.
//

import UIKit

class AdoptDirectVC: UIViewController {
    
    var id:Int!
    var callNumber = "0200000000"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setBackBtn()
        self.setNavigationBarClear()
    }
    
    
    @IBAction func callBtnAction(_ sender: Any) {
        if let phoneCallURL = URL(string: "tel://\(callNumber)") {
            let application: UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: {
                    (success) in
                    
                    if success {
                        self.simpleAlertwithHandler(title: "입양 신청이 완료되었나요?", message: "", okHandler: {
                            (action: UIAlertAction!) in
                            
                            AdoptService.shared.requestOffline(animalIdx: 8) {
                                (data) in
                                
                                print("data ========================")
                                print(data)
                                print("data ========================")
                            }
                        }, cancleHandler: nil)
                    }
                })
            }
        }
    }
}
