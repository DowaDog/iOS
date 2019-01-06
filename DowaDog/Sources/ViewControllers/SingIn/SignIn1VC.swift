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
    
    
    @IBAction func emailCheckAction(_ sender: UIButton) {
        
        self.view.endEditing(true)
        
        guard let email = emailTextField.text else {return}
        
        DuplicateService.shared.duplicateEmail(email: email) { (data) in
            
            print(data)
            
            print("성공")
            
            self.emailCheck = true
        }
        
        
        if emptyCheck == true {
            endCheck()
        }
    }
    
    
    
    @IBAction func nextBtnAction(_ sender: UIButton) {
        if sender.backgroundColor == UIColor(red: 255/255, green: 194/255, blue: 51/255, alpha: 1.0) {
            performSegue(withIdentifier: "goStep2", sender: self)
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
        self.phoneNumbTextField.resignFirstResponder()
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: nameTextField))! || (touch.view?.isDescendant(of: birthTextField))! || (touch.view?.isDescendant(of: emailTextField))! || (touch.view?.isDescendant(of: phoneNumbTextField))! {
            
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
