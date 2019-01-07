//
//  SignIn1VC.swift
//  DowaDog
//
//  Created by 조윤영 on 30/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//


//TODO: 코드 이쁘게 함수로 정리
//TODO: 키보드 이동 확인
//다음 버튼 활성화 시점 확인

import UIKit

class SignIn1VC: UIViewController {
    
    var emailCheck = false
    var emptyCheck = false
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var birthTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var phoneNumbTextField: UITextField!
    @IBOutlet var topConstraint: NSLayoutConstraint!
    @IBOutlet var nextBtn: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        nextBtn.isEnabled = false

        setBackBtn()
        
        setupTap()
        
        setTextFieldTarget()
        
        initGestureRecognizer()
        
        profileImage.circleImageView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unregisterForKeyboardNotifications()
    }
    

    @objc func textFieldDidChange(textField: UITextField){
        
        if nameTextField.text == "" || birthTextField.text == "" || phoneNumbTextField.text == "" || emailTextField.text == "" {
            
            emptyCheck = false
            nextBtn.backgroundColor = UIColor(red: 205/255, green: 205/255, blue: 205/255, alpha: 1.0)
        }
        
        if nameTextField.text != "" {
            if birthTextField.text != ""{
               
                if phoneNumbTextField.text != "" {
                    if emailTextField.text != "" {
                        //모든 텍스트 필드가 null이 아니라면
                        emptyCheck = true
                        print("emptycheck end")
                        endCheck()
                            
                        }
                    }
                }
            }
        }


    @IBAction func emailCheckAction(_ sender: UIButton) {
        
        self.view.endEditing(true)
        
        guard let email = emailTextField.text
            else { return }
        
        
        DuplicateService.shared.duplicateEmail(email: email) { (data) in
            
            print(data)
            print("성공")
            
            if data.data == false{
                self.simpleAlert(title: "", message: "중복 확인 완료했개!")
                self.emailCheck = true
                self.endCheck()

            }else if data.data == true{
                    self.simpleAlert(title: "", message: "이미 등록된 이메일입니다. 다시 입력해주세요!")
                self.emailCheck = false
                
            }
        }
    }

    @IBAction func nextBtnAction(_ sender: UIButton) {
        nextBtn.isEnabled = true
        
        if sender.backgroundColor == UIColor(red: 255/255, green: 194/255, blue: 51/255, alpha: 1.0) {

        }
    }
    
    func setTextFieldTarget(){
        
        nameTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        birthTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        phoneNumbTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
    }
    
    func endCheck (){
        if emptyCheck == true && emailCheck == true {
            //모든 텍스트필드가 null이 아니고 이메일이 중복되지 않는다면,
            
            nextBtn.backgroundColor = UIColor.init(displayP3Red: 1, green: 194/255, blue: 51/255, alpha: 1)
            
            nextBtn.isEnabled = true
            //다음 버튼 활성화
            
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "action_show" {
            let name = nameTextField.text
            let birth = birthTextField.text
            let email = emailTextField.text
            let numb = phoneNumbTextField.text
            let profile = profileImage.image
            
            let dvc = segue.destination as! SignIn2VC
            dvc.name = name
            dvc.birth = birth
            dvc.email = email
            dvc.numb = numb
            dvc.profileImage = profile
            
            // segue.destination은 세그웨이 목적지 뷰컨트롤러를 의미합니다.
            // 위와같이 데이터전달을 수행할 수 있습니다.
            
        }

    }
    


    func setupTap() {
        
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        self.profileImage.addGestureRecognizer(imageTap)
    }
    
    
    @objc func imageTapped() {
        print("tap")
        let picker = UIImagePickerController()
        picker.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo sourse", message: "Choose a source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                picker.sourceType = .camera
                picker.allowsEditing = true
                picker.showsCameraControls = true
                self.present(picker, animated: true)
            } else {
                print("not available")
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action) in
            picker.sourceType = .photoLibrary
            picker.allowsEditing = true
            self.present(picker, animated: true)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancle", style: .cancel))
        self.present(actionSheet, animated: true)
    }
    
    
}

extension SignIn1VC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //이미지를 선택하지 않고 피커 종료시에 실행되는 delegate 메소드
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    //이미지 피커에서 이미지를 선택하였을 때 일어나는 이벤트를 작성하는 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var newImg = UIImage()
        
        if let possibleImg = info[.editedImage] as? UIImage {
            newImg = possibleImg
            
        }
        else if let possibleImg = info[.originalImage] as? UIImage {
            newImg = possibleImg
        }
        else {
            return
        }
        profileImage.image = newImg
        profileImage.clipsToBounds = true
        profileImage.layer.cornerRadius = profileImage.layer.frame.size.height/2
        
        dismiss(animated: true, completion: nil)
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
            self.topConstraint.constant = -80
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
