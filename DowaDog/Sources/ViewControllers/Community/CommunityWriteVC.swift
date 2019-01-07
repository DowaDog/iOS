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
    var keyboardHeight: CGFloat = 0
    
    let picker = UIImagePickerController()
    
    @IBOutlet var imageBox: UIView!
    
    @IBOutlet var imgBtn1: UIButton!
    @IBOutlet var imgBtn2: UIButton!
    @IBOutlet var imgBtn3: UIButton!
    @IBOutlet var imgBtn4: UIButton!
    
    var tempImage = UIImage()
    
    var defaultImage = UIImage(named: "writingPlusBtn")
    var uploadImage1 = UIImage(named: "writingPlusBtn")
    var uploadImage2 = UIImage(named: "writingPlusBtn")
    var uploadImage3 = UIImage(named: "writingPlusBtn")
    var uploadImage4 = UIImage(named: "writingPlusBtn")
    
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
    
    func showBox() {
        imageBox.isHidden = false
    }
    
    func hideBox() {
        imageBox.isHidden = true
    }
    
    @IBAction func btnAction(_ sender: UIButton) {
        if sender.currentImage == defaultImage {
            photoActionSheet()
            if tempImage != UIImage() {
                sender.setImage(tempImage, for: .normal)
            }
        }
//        else {
//            simpleAlertwithHandler(title: "첨부한 이미지를 삭제합니다.", message: "") { (UIAlertAction) in
//                sender.setImage(self.defaultImage, for: .normal)
//
//                switch sender {
//                case self.imgBtn1:
//                    if self.imgBtn2.currentImage != self.defaultImage {
//                        self.imgBtn1.setImage(self.imgBtn2.currentImage, for: .normal)
//                        self.imgBtn2.setImage(self.defaultImage, for: .normal)
//
//                        if self.imgBtn3.currentImage != self.defaultImage {
//                            self.imgBtn2.setImage(self.imgBtn3.currentImage, for: .normal)
//                            self.imgBtn3.setImage(self.defaultImage, for: .normal)
//
//                            if self.imgBtn4.currentImage != self.defaultImage {
//                                self.imgBtn3.setImage(self.imgBtn4.currentImage, for: .normal)
//                                self.imgBtn4.setImage(self.defaultImage, for: .normal)
//                            } else {
//                                self.imgBtn4.isHidden = true
//                            }
//                        } else {
//                            self.imgBtn3.isHidden = true
//                        }
//                    } else {
//                        self.hideBox()
//                    }
//                    break;
//
//                case self.imgBtn2:
//                    if self.imgBtn3.currentImage != self.defaultImage {
//                        self.imgBtn2.setImage(self.imgBtn3.currentImage, for: .normal)
//                        self.imgBtn3.setImage(self.defaultImage, for: .normal)
//
//                        if self.imgBtn4.currentImage != self.defaultImage {
//                            self.imgBtn3.setImage(self.imgBtn4.currentImage, for: .normal)
//                            self.imgBtn4.setImage(self.defaultImage, for: .normal)
//                        }
//                    }
//
//                    break;
//
//                case self.imgBtn3:
//                    if self.imgBtn4.currentImage != self.defaultImage {
//                        self.imgBtn3.setImage(self.imgBtn4.currentImage, for: .normal)
//                        self.imgBtn4.setImage(self.defaultImage, for: .normal)
//                    }
//                    break;
//
//                case self.imgBtn4:
//                    self.imgBtn4.setImage(self.defaultImage, for: .normal)
//                    break;
//
//                default:
//                    break;
//                }
//            }
//        }
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
    
        tempImage = newImg
        showBox()
        
        
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
        
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            keyboardHeight = keyboardRectangle.height
        }
        
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            self.photoViewConstraint.constant = self.keyboardHeight
        })
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {return}
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            self.photoViewConstraint.constant = 0 //스택 뷰의 제약조건을 변경한다.
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
