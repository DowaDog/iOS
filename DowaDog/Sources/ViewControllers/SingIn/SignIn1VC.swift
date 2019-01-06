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
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var birthTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var phoneNumbTextField: UITextField!
    
    @IBOutlet var topConstraint: NSLayoutConstraint!
    
    @IBOutlet var nextBtn: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        nextBtn.isEnabled = false
        nameTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        birthTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        phoneNumbTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        
        setBackBtn()
        
        initGestureRecognizer()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unregisterForKeyboardNotifications()
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
        
        
        guard let email = emailTextField.text else {return}
        self.showToast(controller: self, message: "after guard", seconds: 1.0)
        
        UserService.shared.duplicateEmail(email: email) { (data) in
            self.showToast(controller: self, message: "통신", seconds: 1.0)
            self.view.endEditing(true)
            
            self.emailCheck = true
            
            print("data =====================")
            print(data)
            print("data =====================")
        }
        
        
        
        if emptyCheck == true {
            endCheck()
        }
        
        
    }
}




extension SignIn1VC: UIGestureRecognizerDelegate {
    
    func initGestureRecognizer() {
        let textFieldTap = UITapGestureRecognizer(target: self, action: #selector(handleTapTextField(_:)))
        textFieldTap.delegate = self
        view.addGestureRecognizer(textFieldTap)
    }
    
    
    @objc func handleTapTextField(_ sender: UITapGestureRecognizer){
        self.nameTextField.resignFirstResponder()
        self.birthTextField.resignFirstResponder()
        self.emailTextField.resignFirstResponder()
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: nameTextField))! || (touch.view?.isDescendant(of: birthTextField))! || (touch.view?.isDescendant(of: emailTextField))! {
            
            return false
        }
        return true
    }
    
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {return}
        
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            self.topConstraint.constant = -160
        })
        
        self.view.layoutIfNeeded()
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {return}
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            self.topConstraint.constant = 79
        })
        
        self.view.layoutIfNeeded()
    }
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func unregisterForKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}
