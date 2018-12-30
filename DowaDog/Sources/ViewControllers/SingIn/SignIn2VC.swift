//
//  SignIn2VC.swift
//  DowaDog
//
//  Created by 조윤영 on 30/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit

class SignIn2VC: UIViewController {
    
    var emptyCheck = false
    var idCheck = false
    
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var level1: UILabel!
    
    @IBOutlet weak var level2: UILabel!
    
    @IBOutlet weak var idTextField: UITextField!
    
    @IBOutlet weak var pwTextField: UITextField!
    
    @IBOutlet weak var pwCheckTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.isEnabled = false
        
        //        self.setBackBtn()
        level1.circleRadius()
        level2.circleRadius()
        idTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        pwTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        pwCheckTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        
        
        
        if idTextField.text == "" || pwTextField.text == "" || pwCheckTextField.text == ""  {
            nextBtn.backgroundColor = UIColor(red: 205/255, green: 205/255, blue: 205/255, alpha: 1.0)
        }
        
        if idTextField.text != "" {
            if pwTextField.text != "" {
                if pwCheckTextField.text != "" {
                    
                    emptyCheck = true
                    
                    if idCheck == true {
                        endCheck()
                    }
                    
                }
            }
        }
        
        
    }
    func endCheck (){
        if emptyCheck == true && idCheck == true {
            
            nextBtn.backgroundColor = UIColor.init(displayP3Red: 1, green: 194/255, blue: 51/255, alpha: 1)
            nextBtn.isEnabled = true
            
        }
    }
    
    @IBAction func checkEmailAction(_ sender: Any) {
        self.showToast(controller: self, message: "중복 여부 판단", seconds: 1.0)
        
        idCheck = true
        
        if emptyCheck == true {
            endCheck()
        }
        
    }
    
}

