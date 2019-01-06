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
    
    var token = [Token]()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginBtn.circleRadius()
        aroundBtn.circleRadius()
        loginBtn.dropShadow()//그림자 안먹힘
        aroundBtn.dropShadow()//그림자 안먹힘
        idTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        pwTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        
        
        initGestureRecognizer()
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
            
            
            guard let id = idTextField.text else { return }
            guard let password = pwTextField.text else { return }
            
            LoginService.shared.login(id: id, password: password) { (data) in
                
                self.view.endEditing(true)
                
                UserDefaults.standard.set(data.accessToken?.data, forKey: "accessToken")
                UserDefaults.standard.set(data.refreshToken?.data, forKey: "accessToken")
                
                let login = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeNav") as! UINavigationController
                
                self.present(login, animated: true, completion: nil)
                
                self.showToast(controller: self, message: "홈으로 이동 총총", seconds: 1.0)
            }
        }
    }
}

extension LoginVC: UIGestureRecognizerDelegate {
    
    func initGestureRecognizer() {
        let textViewTap = UITapGestureRecognizer(target: self, action: #selector(handleTapTextView(_:)))
        textViewTap.delegate = self
        view.addGestureRecognizer(textViewTap)
    }
    
    @objc func handleTapTextView(_ sender: UITapGestureRecognizer){
        self.idTextField.resignFirstResponder()
        self.pwTextField.resignFirstResponder()
    }
    
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: idTextField))! || (touch.view?.isDescendant(of: pwTextField))! {
            
            return false
        }
        return true
    }
    
    
    
    
}
