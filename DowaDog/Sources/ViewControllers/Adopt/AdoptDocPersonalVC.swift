//
//  AdoptDocPersonalVC.swift
//  DowaDog
//
//  Created by wookeon on 31/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit

class AdoptDocPersonalVC: UIViewController {
    
    @IBOutlet var topViewConstraint: NSLayoutConstraint!
    
    @IBOutlet var profileImage: UIImageView!
    
    @IBOutlet var addressTextField: UITextField!
    @IBOutlet var jobTextField: UITextField!
    @IBOutlet var nextBtn: UIButton!
    
    var agreeFlag: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNavigationBarClear()
        self.setBackBtn()
        
        initGestureRecognizer()
        setTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unregisterForKeyboardNotifications()
    }
    
    func setTextField() {
        addressTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        
        jobTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(textField: UITextField) {
        if addressTextField.text != "" && jobTextField.text != "" && agreeFlag == true {
            nextBtn.backgroundColor = UIColor(red: 255/255, green: 194/255, blue: 51/255, alpha: 1.0)
        } else {
            nextBtn.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1.0)
        }
    }
    
    @IBAction func personalEditAction(_ sender: Any) {
        let dvc = UIStoryboard(name: "MyProfile", bundle: nil).instantiateViewController(withIdentifier: "MyProfileNav") as! UINavigationController
        
        self.present(dvc, animated: true, completion: nil)
//        self.show(dvc, sender: self)
    }
    
    
    @IBAction func checkBoxAction(_ sender: UIButton) {
        agreeFlag = !agreeFlag
        sender.isSelected = !sender.isSelected
        
        sender.setImage(UIImage(named:"adoptingDocumentCheckGrey"), for: .normal)
        sender.setImage(UIImage(named:"adoptingDocumentCheckYellow"), for: .selected)
        
        if addressTextField.text != "" && jobTextField.text != "" && agreeFlag == true {
            nextBtn.backgroundColor = UIColor(red: 255/255, green: 194/255, blue: 51/255, alpha: 1.0)
        } else {
            nextBtn.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1.0)
        }
    }
    
    @IBAction func nextBtn(_ sender: UIButton) {
        if sender.backgroundColor == UIColor(red: 255/255, green: 194/255, blue: 51/255, alpha: 1.0) {
            performSegue(withIdentifier: "goStep2", sender: self)
        }
    }
}



extension AdoptDocPersonalVC: UIGestureRecognizerDelegate {
    
    func initGestureRecognizer() {
        let textFieldTap = UITapGestureRecognizer(target: self, action: #selector(handleTapTextField(_:)))
        textFieldTap.delegate = self
        view.addGestureRecognizer(textFieldTap)
        
        let profileImageTap = UITapGestureRecognizer(target: self, action: #selector(handleTapImageView(_:)))
        profileImageTap.delegate = self
        view.addGestureRecognizer(profileImageTap)
    }
    
    @objc func handleTapImageView(_ sender: UITapGestureRecognizer) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        self.present(picker, animated: true)
    }
    
    @objc func handleTapTextField(_ sender: UITapGestureRecognizer){
        self.addressTextField.resignFirstResponder()
        self.jobTextField.resignFirstResponder()
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: addressTextField))! || (touch.view?.isDescendant(of: jobTextField))! {
            
            return false
        }
        return true
    }
    
    
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {return}
        
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            self.topViewConstraint.constant = 190
        })
        
        self.view.layoutIfNeeded()
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {return}
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            self.topViewConstraint.constant = 64
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



extension AdoptDocPersonalVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //이미지를 선택하지 않고 피커 종료시에 실행되는 delegate 메소드
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
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
        profileImage.layer.cornerRadius = 34
        
        dismiss(animated: true, completion: nil)
    }
}
