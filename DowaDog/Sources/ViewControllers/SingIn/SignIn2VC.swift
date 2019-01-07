//
//  SignIn2VC.swift
//  DowaDog
//
//  Created by 조윤영 on 30/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit



class SignIn2VC: UIViewController {
    
    
    var name:String?
    var birth:String?
    var email:String?
    var numb:String?
    var profileImage: UIImage?
    
    
    var emptyCheck = false
    var idCheck = false
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    @IBOutlet weak var pwCheckTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.isEnabled = true
        
        setTarget()
        
        self.setBackBtn()
        
        initGestureRecognizer()
        
    }
    
    
    func setTarget(){
        
        idTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        pwTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        pwCheckTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unregisterForKeyboardNotifications()
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        if idTextField.text == "" || pwTextField.text == "" || pwCheckTextField.text == ""  {
            nextBtn.backgroundColor = UIColor(red: 205/255, green: 205/255, blue: 205/255, alpha: 1.0)
        }
        
        if idTextField.text != "" {
            if pwTextField.text != "" {
                if pwCheckTextField.text != "" {
                    
                    emptyCheck = true
                    endCheck()
                    
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
            
            if data.data == false{
                
                self.simpleAlert(title: "", message: "아이디 사용 가능하개")
                self.idCheck = true
                self.endCheck()
                
            }
            else if data.data == true{
                
                self.simpleAlert(title: "", message: "사용할 수 없는 아이디에요! 다시 입력해주개")
                self.idCheck = false
            }
            
            
        }
        
    }
    
    
    @IBAction func submitAction(_ sender: UIButton) {
        
        
        guard let id = idTextField.text else{return}
        guard let password = pwTextField.text else{return}
        guard let name = name else{ return}
        guard let birth = birth else{return}
        guard let phone = numb else{return}
        guard let email = email else{return}
        guard let profile = profileImage else{return}
        //이미지 꼴 바꾸기 kingfisher
        
        
        if pwCheckTextField.text == pwTextField.text{
            
            DuplicateService.shared.signUp(id: id, password: password, name: name, birth: birth, phone: phone, email: email, profileImgFile: profile) {
                
                (data) in
                
                print("회원가입")
                
                if let dvc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC {
                    
                    //present를 해줍니다.
                    self.present(dvc, animated: true)
                    
                }
            }
        } else if pwCheckTextField.text != pwTextField.text{
            
            simpleAlert(title: "", message: "패스워드가 일치하지 않개!")
        }
    }
}


extension SignIn2VC: UIGestureRecognizerDelegate {
    
    func initGestureRecognizer() {
        let textFieldTap = UITapGestureRecognizer(target: self, action: #selector(handleTapTextField(_:)))
        textFieldTap.delegate = self
        view.addGestureRecognizer(textFieldTap)
    }
    
    
    @objc func handleTapTextField(_ sender: UITapGestureRecognizer){
        self.idTextField.resignFirstResponder()
        self.pwTextField.resignFirstResponder()
        self.pwCheckTextField.resignFirstResponder()
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: idTextField))! || (touch.view?.isDescendant(of: pwTextField))! || (touch.view?.isDescendant(of: pwCheckTextField))! {
            
            return false
        }
        return true
    }
    
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {return}
        
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            self.topConstraint.constant = -5
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
