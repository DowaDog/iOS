//
//  SignIn2VC.swift
//  DowaDog
//
//  Created by 조윤영 on 30/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit

class SignIn2VC: UIViewController {
    
    var emptyCheck = true
    var idCheck = true
    
    
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    @IBOutlet weak var pwCheckTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.isEnabled = true
        
        self.setBackBtn()
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
    
    @IBAction func checkIdAction(_ sender: Any) {
        
        guard let id = idTextField.text else {return}
        
        DuplicateService.shared.duplicateId(id: id) { (data) in
            
            print(data)
            
            print("성공")
            
        
            self.idCheck = true
        }
        
        
        
        if emptyCheck == true {
            endCheck()
        }
        
    }
    
    
    @IBAction func submitAction(_ sender: UIButton) {
        
        DuplicateService.shared.signUp(id: "wook1234", password: "1234", name: "이승언", birth: "1994-10-04", phone: "010-1234-1234", email: "test1234@naver.com", profileImgFile: UIImage(named: "xBtn")!) {
            
            print("회원가입")
        }
    }
}
