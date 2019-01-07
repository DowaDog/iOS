//
//  MyProfileVC.swift
//  DowaDog
//
//  Created by 조윤영 on 30/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit

class MyProfileVC: UIViewController {

    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    var confirmItem : UIBarButtonItem!
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var birth: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        confirmItem = UIBarButtonItem(title: "확인", style: .plain, target: self, action: #selector(confirmTapped))
         confirmItem.tintColor = UIColor.init(displayP3Red: 1, green: 194/255, blue: 51/255, alpha: 1)
        
        navigationItem.rightBarButtonItems = [ confirmItem ]
        
         setupTap()
        profileImage.circleImageView()
        
        initGestureRecognizer()
        
        self.title = "개인 정보 수정"
        
        email.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("transfer=========")
        MyInfoService.shared.getMyInfo() {
            (data) in
            
            print("data ===================")
            print(data)
            print("data ===================")
        
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy/MM/dd"
           

            self.profileImage.imageFromUrl(data.data?.thumbnailImg, defaultImgPath: "")
            self.name.text = self.gsno(data.data?.name)
            self.birth.text = dateFormatter.string(from: data.data?.birth ?? Date())
            
            self.phone.text = self.gsno(data.data?.phone)

        }
        print("transfer=========")
    }

    
    @objc func confirmTapped(){
        
        print("transfer=========")
        
        
        MyInfoEditService.shared.putMyInfo(name: "강태경", phone: "010-3068-1191", email: "perlyuy8@naver.com", birth: "1997-04-02", profileImgFile: UIImage(named: "xBtn")!) {
            (data) in
            
            print("data ===================")
            print(data)
            print("data ===================")
        }
        print("transfer=========")
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

extension MyProfileVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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

extension MyProfileVC: UIGestureRecognizerDelegate {
    
    func initGestureRecognizer() {
        let textFieldTap = UITapGestureRecognizer(target: self, action: #selector(handleTapTextField(_:)))
        textFieldTap.delegate = self
        view.addGestureRecognizer(textFieldTap)
    }
    
    
    @objc func handleTapTextField(_ sender: UITapGestureRecognizer){
        self.resignFirstResponder()
        self.name.resignFirstResponder()
        self.birth.resignFirstResponder()
        self.phone.resignFirstResponder()
        self.email.resignFirstResponder()
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of:name))! || (touch.view?.isDescendant(of: birth))! || (touch.view?.isDescendant(of: phone))! || (touch.view?.isDescendant(of: email))! {
            
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
