//
//  AdoptDocPersonalVC.swift
//  DowaDog
//
//  Created by wookeon on 31/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit

class AdoptDocPersonalVC: UIViewController {
    
    var positive: Bool = false
    var textFlag: Bool = false
    var textTemp: String = ""
    @IBOutlet var jobTextField: UITextField!
    
    @IBOutlet var topViewConstraint: NSLayoutConstraint!
    
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var addressTextView: CumstomTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNavigationBarClear()
        self.setBackBtn()
        self.addressTextView.delegate = self
        
        initGestureRecognizer()
        setPlaceholder()
    }
    
    func setPlaceholder() {
        addressTextView.textColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1.0)
        addressTextView.text = "입력해주세요"
    }
    
    
    @IBAction func agreeBtnAction(_ sender: UIButton) {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unregisterForKeyboardNotifications()
    }
}

extension AdoptDocPersonalVC: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        
        if text != "\u{232B}" {
            textTemp = text
        }
        
        return true
    }
    
//    func textViewDidBeginEditing(_ textView: UITextView) {
//
//        if (textView.text == "입력해주세요" && textView.textColor == UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1.0))
//        {
//            textView.text = ""
//            textView.textColor = UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1.0)
//        }
//
//        textView.becomeFirstResponder()
//    }
    func textViewDidChange(_ textView: UITextView) {
        
        if textView.text == "" {
            textView.text = "입력해주세요"
            textView.textColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1.0)
            textFlag = false
        } else if textFlag == false && textView.textColor == UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1.0) {
            textView.text = ""
            textView.text = textTemp
            textView.textColor = UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1.0)
            textFlag = true
        }
        textView.becomeFirstResponder()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = "입력해주세요"
            textView.textColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1.0)
            textFlag = false
        }
        textView.resignFirstResponder()
    }
}

extension AdoptDocPersonalVC: UIGestureRecognizerDelegate {
    
    func initGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTabMainView(_:)))
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTabMainView(_ sender: UITapGestureRecognizer){
        self.addressTextView.resignFirstResponder()
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: addressTextView))! {
            return false
        }
        return true
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {return}
        
        //duration 과 cruve 는
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            self.topViewConstraint.constant = 200 //스택 뷰의 제약조건을 변경한다.
        })
        
        self.view.layoutIfNeeded()
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {return}
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            self.topViewConstraint.constant = 64 //스택 뷰의 제약조건을 변경한다.
        })
        
        self.view.layoutIfNeeded()
    }
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func unregisterForKeyboardNotifications() { //뷰에서 나갈 때 옵저버를 해제해야한다.
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}
