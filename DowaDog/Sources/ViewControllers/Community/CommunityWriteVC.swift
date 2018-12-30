//
//  CommunityWriteVC.swift
//  DowaDog
//
//  Created by wookeon on 29/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit

class CommunityWriteVC: UIViewController {

    @IBOutlet var textView: UITextView!
    @IBOutlet var photoViewConstraint: NSLayoutConstraint!
    
    let picker = UIImagePickerController()
    
    @IBOutlet var imageBox: UIView!
    
    @IBOutlet var imgBtn1: UIButton!
    @IBOutlet var image1: UIImageView!
    var imgFlag1: Bool = false
    
    @IBOutlet var imgBtn2: UIButton!
    @IBOutlet var image2: UIImageView!
    var imgFlag2: Bool = false
    
    @IBOutlet var imgBtn3: UIButton!
    @IBOutlet var image3: UIImageView!
    var imgFlag3: Bool = false
    
    @IBOutlet var imgBtn4: UIButton!
    @IBOutlet var image4: UIImageView!
    var imgFlag4: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        
        // set Navigation Bar
        self.setNavigationBarShadow()
        self.setTopItem(title: "글 작성하기")
        self.setLeftBtn(title: "취소", color: UIColor(red: 111/255, green: 111/255, blue: 111/255, alpha: 1.0))
        self.setRightBtn(title: "확인", color: UIColor(red: 255/255, green: 194/255, blue: 51/255, alpha: 1.0))
        
        initGestureRecognizer()
    }
    
    
    @IBAction func btnAction(_ sender: UIButton) {
        switch (sender) {
        case imgBtn1:
            if image1.image == UIImage(named: "writingPlusBtn") {
                photoActionSheet()
            } else {
                image1.image = UIImage(named: "writingPlusBtn")
            }
            break
        case imgBtn2:
            if image2.image == UIImage(named: "writingPlusBtn") {
                photoActionSheet()
            } else {
                image2.image = UIImage(named: "writingPlusBtn")
            }
            break
        case imgBtn3:
            if image3.image == UIImage(named: "writingPlusBtn") {
                photoActionSheet()
            } else {
                image3.image = UIImage(named: "writingPlusBtn")
            }
            break
        case imgBtn4:
            if image4.image == UIImage(named: "writingPlusBtn") {
                photoActionSheet()
                image4.image = UIImage(named: "writingPlusBtn")
            }
            break
        default:
            print("default")
            break
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unregisterForKeyboardNotifications()
    }
    
    @IBAction func cameraBtnAction(_ sender: Any) {
        photoActionSheet()
    }
    
    func photoActionSheet() {
        
        let actionSheet = UIAlertController(title: "사진 첨부", message: "사진은 최대 4장까지 업로드 가능합니다", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "카메라", style: .default, handler: { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.picker.sourceType = .camera
                self.picker.allowsEditing = true
                self.picker.showsCameraControls = true
                self.present(self.picker, animated: true)
            } else {
                print("not available")
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "앨범", style: .default, handler: { (action) in
            self.picker.sourceType = .photoLibrary
            self.picker.allowsEditing = true
            self.present(self.picker, animated: true)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "취소", style: .cancel))
        self.present(actionSheet, animated: true)
    }
}

// image picker 정의
extension CommunityWriteVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
        
        
        
        dismiss(animated: true, completion: nil)
    }
}

// 하단 뷰를 키보드에 맞게 움직이는 작업
extension CommunityWriteVC: UIGestureRecognizerDelegate {
    func initGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapTextView(_:)))
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTapTextView(_ sender: UITapGestureRecognizer) {
        self.textView.resignFirstResponder()
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: textView))! {

            return false
        }

        return true
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {return}
        
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            self.photoViewConstraint.constant = -369 //스택 뷰의 제약조건을 변경한다.
        })
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {return}
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            self.photoViewConstraint.constant = -154 //스택 뷰의 제약조건을 변경한다.
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
