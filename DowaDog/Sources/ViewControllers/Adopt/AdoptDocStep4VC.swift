//
//  AdoptDocStep4VC.swift
//  DowaDog
//
//  Created by wookeon on 03/01/2019.
//  Copyright © 2019 wookeon. All rights reserved.
//

import UIKit

class AdoptDocStep4VC: UIViewController {
    
    // CheckBox
    @IBOutlet var checkBox1: UIButton!
    @IBOutlet var checkBox2: UIButton!
    @IBOutlet var checkBox3: UIButton!
    @IBOutlet var checkBox4: UIButton!
    @IBOutlet var checkBox5: UIButton!
    @IBOutlet var checkBoxAll: UIButton!

    
    // TextField
    @IBOutlet var textFieldView: UIView!
    @IBOutlet var textField: UITextField!
    @IBOutlet var topConstraint: NSLayoutConstraint!

    // ColorChip
    let normalColor: UIColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1.0)
    let selectColor: UIColor = UIColor(red: 255/255, green: 194/255, blue: 51/255, alpha: 1.0)

    // NextButton
    @IBOutlet var nextBtn: UIButton!

    // ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarClear()
        self.setBackBtn()
        
        textFieldView.layer.cornerRadius = textFieldView.layer.frame.size.height/2

        initGestureRecognizer()
        setTextField()
    }

    // Observer
    override func viewWillAppear(_ animated: Bool) {
        registerForKeyboardNotifications()
    }
    override func viewWillDisappear(_ animated: Bool) {
        unregisterForKeyboardNotifications()
    }

    // CheckBox Action
    @IBAction func checkBoxAction(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected

        checkBox1.setImage(UIImage(named:"adoptingDocumentCheckGrey"), for: .normal)
        checkBox1.setImage(UIImage(named:"adoptingDocumentCheckYellow"), for: .selected)
        checkBox2.setImage(UIImage(named:"adoptingDocumentCheckGrey"), for: .normal)
        checkBox2.setImage(UIImage(named:"adoptingDocumentCheckYellow"), for: .selected)
        checkBox3.setImage(UIImage(named:"adoptingDocumentCheckGrey"), for: .normal)
        checkBox3.setImage(UIImage(named:"adoptingDocumentCheckYellow"), for: .selected)
        checkBox4.setImage(UIImage(named:"adoptingDocumentCheckGrey"), for: .normal)
        checkBox4.setImage(UIImage(named:"adoptingDocumentCheckYellow"), for: .selected)
        checkBox5.setImage(UIImage(named:"adoptingDocumentCheckGrey"), for: .normal)
        checkBox5.setImage(UIImage(named:"adoptingDocumentCheckYellow"), for: .selected)
        checkBoxAll.setImage(UIImage(named:"adoptingDocumentCheckGrey"), for: .normal)
        checkBoxAll.setImage(UIImage(named:"adoptingDocumentCheckYellow"), for: .selected)


        if sender == checkBoxAll {
            if sender.isSelected {
                checkBox1.isSelected = true
                checkBox2.isSelected = true
                checkBox3.isSelected = true
                checkBox4.isSelected = true
                checkBox5.isSelected = true

                nextBtn.backgroundColor = selectColor
            } else {
                checkBox1.isSelected = false
                checkBox2.isSelected = false
                checkBox3.isSelected = false
                checkBox4.isSelected = false
                checkBox5.isSelected = false

                nextBtn.backgroundColor = normalColor
            }

            self.view.endEditing(true)
        }

        if checkBox1.isSelected == true && checkBox2.isSelected && checkBox3.isSelected && checkBox4.isSelected && checkBox5.isSelected && textField.text != "" {
            checkBoxAll.isSelected = true

            nextBtn.backgroundColor = selectColor
        } else {
            checkBoxAll.isSelected = false

            nextBtn.backgroundColor = normalColor
        }
    }

    // TextField Action
    func setTextField() {
        textField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
    }

    @objc func textFieldDidChange(textField: UITextField) {
        if textField.text != "" && checkBoxAll.isSelected {
            nextBtn.backgroundColor = selectColor
        } else {
            nextBtn.backgroundColor = normalColor
        }
    }


    @IBAction func nextBtnAction(_ sender: UIButton) {
        if nextBtn.backgroundColor == selectColor {
            performSegue(withIdentifier: "goEnd", sender: self)
        }
    }
}



// 키보드 레이아웃 관련 extension
extension AdoptDocStep4VC: UIGestureRecognizerDelegate {

    func initGestureRecognizer() {
        let textFieldTap = UITapGestureRecognizer(target: self, action: #selector(handleTapTextField(_:)))
        textFieldTap.delegate = self
        view.addGestureRecognizer(textFieldTap)
    }

    @objc func handleTapTextField(_ sender: UITapGestureRecognizer){
        self.textField.resignFirstResponder()
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: textField))!  {

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
            self.topConstraint.constant = 16
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
