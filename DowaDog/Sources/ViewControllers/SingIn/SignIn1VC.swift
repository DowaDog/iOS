//
//  SignIn1VC.swift
//  DowaDog
//
//  Created by 조윤영 on 30/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit

class SignIn1VC: UIViewController {
    
    var emailCheck = false
    var emptyCheck = false
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var birthTextField: UITextField!
    
    @IBOutlet weak var phoneNumbTextField: UITextField!
    
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        nextBtn.isEnabled = false
        nameTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        birthTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        phoneNumbTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        
        setBackBtn()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        
        if nameTextField.text == "" || birthTextField.text == "" || phoneNumbTextField.text == "" || emailTextField.text == "" {
            nextBtn.backgroundColor = UIColor(red: 205/255, green: 205/255, blue: 205/255, alpha: 1.0)
        }
        
        if nameTextField.text != "" {
            if birthTextField.text != ""{
                if phoneNumbTextField.text != "" {
                    if emailTextField.text != "" {
                        emptyCheck = true
                        
                        if emailCheck == true {
                            endCheck()
                        }
                    }
                }
            }
        }
    }
    
    func endCheck (){
        if emptyCheck == true && emailCheck == true {
            
            nextBtn.backgroundColor = UIColor.init(displayP3Red: 1, green: 194/255, blue: 51/255, alpha: 1)
            nextBtn.isEnabled = true
            
        }
    }
    
    
    @IBAction func emailCheckAction(_ sender: Any) {
        self.showToast(controller: self, message: "중복 여부 판단", seconds: 1.0)
        emailCheck = true
        
        if emptyCheck == true {
            endCheck()
        }
        
        
    }
}




