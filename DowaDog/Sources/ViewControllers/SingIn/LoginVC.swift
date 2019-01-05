//
//  LoginVC.swift
//  DowaDog
//
//  Created by 조윤영 on 30/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    var emptyCheck = false
    
    @IBOutlet weak var idTextField: UITextField!
    
    @IBOutlet weak var pwTextField: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    
    @IBOutlet weak var aroundBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackBtn()
        
        loginBtn.circleRadius()
        aroundBtn.circleRadius()
        loginBtn.dropShadow()//그림자 안먹힘
        aroundBtn.dropShadow()//그림자 안먹힘
        idTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        pwTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        
        if idTextField.text == "" || pwTextField.text == "" {
            emptyCheck = false
        }
        
        
        if idTextField.text != "" {
            if pwTextField.text != ""{
                emptyCheck = true
                
                
            }
        }
        
        
        
    }
    
    
    @IBAction func loginAction(_ sender: Any) {
        if emptyCheck == false{
            self.showToast(controller: self, message: "아이디와 비밀버호를 모두 입력했는지 확인하세요!", seconds: 1.0)
        }
        else {
            self.showToast(controller: self, message: "홈으로 이동 총총", seconds: 1.0)
        }
    }
    
    
}

