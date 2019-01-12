//
//  AdoptDocStep2VC.swift
//  DowaDog
//
//  Created by wookeon on 01/01/2019.
//  Copyright © 2019 wookeon. All rights reserved.
//

import UIKit

class AdoptDocStep2VC: UIViewController {

    @IBOutlet var topConstraint: NSLayoutConstraint!
    @IBOutlet var bottomConstraint: NSLayoutConstraint!
    
    var defaultImage: UIImage? = UIImage(named: "dogProfileImg")
    
    @IBOutlet var agreeBtn: UIButton!
    @IBOutlet var disagreeBtn: UIButton!
    
    @IBOutlet var topLabel: UILabel!
    @IBOutlet var bottomLabel: UILabel!
    @IBOutlet var contentView: UITextView!
    
    @IBOutlet var animalImage: UIImageView!
    
    @IBOutlet var nextBtn: UIButton!
    var getPhoneNumb:String?
    var getEmail:String?
    var getAddress:String?
    var getWork:String?
    var id:Int!
    
    let placeholder: String = "예시) 몇 마리를 키우는지, 크기는 어떠한지"
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        self.setBackBtn()
        self.setNavigationBarClear()
        
        contentView.layer.cornerRadius = 10
        contentView.textContainerInset = UIEdgeInsets.init(top: 10, left: 4, bottom: 10, right: 4)
        self.contentView.delegate = self
        
        setPlaceholder()
        
        initGestureRecognizer()
        
        self.topLabel.alpha = 0
        self.bottomLabel.alpha = 0
        self.contentView.alpha = 0
    }
    
    func checkInfo() {
        if (agreeBtn.isSelected == true && (contentView.text != placeholder && contentView.text != "")) || disagreeBtn.isSelected == true {
            nextBtn.backgroundColor = UIColor(red: 255/255, green: 194/255, blue: 51/255, alpha: 1.0)
        } else {
            nextBtn.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1.0)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unregisterForKeyboardNotifications()
    }
    
    func setPlaceholder() {
        contentView.textColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1.0)
        contentView.text = placeholder
    }
    
    func showEdit() {
        UIView.animate(withDuration: 0.5, animations: {
            self.topLabel.alpha = 1
            self.bottomLabel.alpha = 1
            self.contentView.alpha = 1
        })
    }
    
    func hideEdit() {
        UIView.animate(withDuration: 0.5, animations: {
            self.topLabel.alpha = 0
            self.bottomLabel.alpha = 0
            self.contentView.alpha = 0
        })
    }
    
    @IBAction func agreeBtnAction(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        sender.setImage(UIImage(named:"adoptingDocumentCheckGrey"), for: .normal)
        sender.setImage(UIImage(named:"adoptingDocumentCheckYellow"), for: .selected)
    
        if sender == agreeBtn && sender.isSelected == true {
            showEdit()
            animalImage.isUserInteractionEnabled = true
            disagreeBtn.isSelected = false
        } else if sender == agreeBtn && sender.isSelected == false {
            sender.isSelected = true
        } else if sender == disagreeBtn && sender.isSelected == true {
            hideEdit()
            agreeBtn.isSelected = false
            animalImage.image = defaultImage
            animalImage.isUserInteractionEnabled = false
        } else if sender == disagreeBtn && sender.isSelected == false {
            sender.isSelected = true
        }
        
        checkInfo()
    
        self.view.endEditing(true)
    }
    
    
    @IBAction func nextBtnAction(_ sender: UIButton) {
        
        if sender.backgroundColor == UIColor(red: 255/255, green: 194/255, blue: 51/255, alpha: 1.0) && (animalImage.image != defaultImage || disagreeBtn.isSelected == true) {
            performSegue(withIdentifier: "goSelectStep3", sender: self)
            if let dvc = self.storyboard?.instantiateViewController(withIdentifier: "AdoptDocSelectStep3VC") as?AdoptDocSelectStep3VC {
                
                dvc.getPhoneNumb = getPhoneNumb
                dvc.geEmail = getEmail
                dvc.getAddress = getAddress
                dvc.getWork = getWork
                
                dvc.getDogProfile = animalImage.image
                if agreeBtn.isSelected == true{
                      dvc.getHave = true
                }
                else if agreeBtn.isSelected = false{
                    dvc.getHave = false
                }
                dvc.getDetail = contentView.text
            }
        }
        
        if sender.backgroundColor == UIColor(red: 255/255, green: 194/255, blue: 51/255, alpha: 1.0) && animalImage.image == defaultImage && agreeBtn.isSelected == true {
            simpleAlert(title: "사진을 첨부해주세요", message: "")
        }
        
    }
}

extension AdoptDocStep2VC: UITextViewDelegate {

    func textViewDidBeginEditing(_ textView: UITextView) {

        if (textView.text == placeholder && textView.textColor == UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1.0))
        {
            textView.text = ""
            textView.textColor = UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1.0)
        }

        checkInfo()
        
        textView.becomeFirstResponder()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = placeholder
            textView.textColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1.0)
        }
        
        checkInfo()
        
        textView.resignFirstResponder()
    }
}

extension AdoptDocStep2VC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
        animalImage.image = newImg
        
        animalImage.clipsToBounds = true
        animalImage.layer.cornerRadius = animalImage.layer.frame.size.height/2
        
        checkInfo()
        
        dismiss(animated: true, completion: nil)
    }
}

extension AdoptDocStep2VC: UIGestureRecognizerDelegate {
    
    func initGestureRecognizer() {
        let textViewTap = UITapGestureRecognizer(target: self, action: #selector(handleTapTextView(_:)))
        textViewTap.delegate = self
        view.addGestureRecognizer(textViewTap)
        
        let animalImageTap = UITapGestureRecognizer(target: self, action: #selector(handleTapImageView(_:)))
        animalImageTap.delegate = self
        animalImage.addGestureRecognizer(animalImageTap)
    }
    
    @objc func handleTapImageView(_ sender: UITapGestureRecognizer) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        self.present(picker, animated: true)
    }
    
    @objc func handleTapTextView(_ sender: UITapGestureRecognizer){
        self.contentView.resignFirstResponder()
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: contentView))!  {
            
            return false
        }
        return true
    }
    
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {return}
        
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            self.topConstraint.constant = -160
            self.bottomConstraint.constant = 200
        })
        
        self.view.layoutIfNeeded()
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {return}
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            self.topConstraint.constant = 16
            self.bottomConstraint.constant = 24
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
