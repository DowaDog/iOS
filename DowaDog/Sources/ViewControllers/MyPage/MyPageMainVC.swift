//
//  MyPageMainVC.swift
//  DowaDog
//
//  Created by 조윤영 on 04/01/2019.
//  Copyright © 2019 wookeon. All rights reserved.
//

import UIKit

class MyPageMainVC: UIViewController {
    
    @IBOutlet weak var coverView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackBtn()
        coverView.alpha = 0.0
    }
    
    
    @IBAction func logoutAction(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            self.coverView.alpha = 0.5
            
        })
        simpleAlertwithHandler(title: "로그아웃 하시겠습니까?", message: "", okHandler:  {(alert: UIAlertAction!) in
            UIView.animate(withDuration: 0.3, animations: {
                self.coverView.alpha = 0.0
            })}
            , cancleHandler: {(alert: UIAlertAction!) in
                
                self.coverView.alpha = 0.0
        })
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "setting1_show" {
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "취소", style: .plain, target: nil, action: nil)
            self.navigationItem.backBarButtonItem?.tintColor = UIColor.init(displayP3Red: 130/255, green: 130/255, blue: 130/255, alpha: 1)
            
        } else if segue.identifier == "setting2_show" {
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "취소", style: .plain, target: nil, action: nil)
            self.navigationItem.backBarButtonItem?.tintColor = UIColor.init(displayP3Red: 130/255, green: 130/255, blue: 130/255, alpha: 1)
        }
    }
    
}
