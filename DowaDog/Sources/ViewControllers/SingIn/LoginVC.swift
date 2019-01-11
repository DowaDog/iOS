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
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var aroundBtn: UIButton!
    
    var token = [Token]()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNavigationBarClear()
        
        initGestureRecognizer()
    }
    
    
    @IBAction func loginAction(_ sender: Any) {
        
        if idTextField.text == "" || pwTextField.text == "" {
            self.simpleAlert(title: "로그인 실패", message: "아이디 또는 비밀번호를 확인하세요")
        } else {
            guard let id = idTextField.text else { return }
            guard let password = pwTextField.text else { return }
            
            LoginService.shared.login(id: id, password: password) { (data) in
                
                
                if data.message == "로그인 성공" {
                    UserDefaults.standard.set(data.data?.refreshToken?.data, forKey: "Token")
                    
                    let login = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeNav") as! UINavigationController
                    
                    self.present(login, animated: true, completion: nil)
                } else {
                    self.simpleAlert(title: "로그인 실패", message: "아이디 또는 비밀번호를 확인하세요")
                }
            }
            self.view.endEditing(true)
        }
    }
    
    @IBAction func noLoginAction(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "Token")
        
        let login = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeNav") as! UINavigationController
        
        self.present(login, animated: true, completion: nil)
    }
    
    @IBAction func unwindAction(_ sender: UIStoryboardSegue) {}
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

