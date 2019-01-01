//
//  SignIn1VC.swift
//  DowaDog
//
//  Created by 조윤영 on 30/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit

class SignIn1VC: UIViewController {
    
    @IBOutlet weak var checkView: RoundView!
    var emailCheck = false
    var emptyCheck = false
     var mTimer :  Timer?

//     var number : Int = 180
var number : Int!
    var minutes: Int!
    var seconds :Int!
    
    @IBOutlet weak var verifyBtn: UIButton!
    @IBOutlet weak var firstTimeLabel: UILabel!
    @IBOutlet weak var level1: UILabel!
    
    @IBOutlet weak var level2: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var birthTextField: UITextField!
    
    @IBOutlet weak var phoneNumbTextField: UITextField!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        nextBtn.isEnabled = false
        level1.circleRadius()
        level2.circleRadius()
        nameTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        birthTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        phoneNumbTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        
        setBackBtn()

        
 
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    
    
    @IBAction func emailCheckAction(_ sender: Any) {
        self.showToast(controller: self, message: "중복 여부 판단", seconds: 1.0)
        emailCheck = true
        
        if emptyCheck == true {
            endCheck()
        }
        
        
    }

    
    @IBAction func phoneCheckAction(_ sender: Any) {
        number = 180
        checkView.isHidden = false
        if let timer = mTimer{
            if !timer.isValid {
                /** 1초마다 timerCallback함수를 호출하는 타이머 */
                mTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
           
            }
        }else{
            //timer 객체가 nil 인 경우에 객체를 생성하고 타이머를 시작한다
            /** 1초마다 timerCallback함수를 호출하는 타이머 */
            mTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
        }
        
    }
        
    //타이머가 호출하는 콜백함수
    @objc func timerCallback(){
            number -= 1
        
        minutes = number/60
        seconds = number%60
        
        firstTimeLabel.text = String(minutes)
        firstTimeLabel.text?.append(":")
        
        timeLabel.text = String(seconds )
        if seconds == 0 || seconds == 1  || seconds == 2 || seconds == 3 || seconds == 4 || seconds == 5 || seconds == 6 || seconds == 7 || seconds == 8 ||  seconds == 9 {
            firstTimeLabel.text?.append("0")
        }

        
        
        if minutes == 0 && seconds == 0{
            if let timer = mTimer {
                if(timer.isValid){
                    timer.invalidate()
                }
            }
        simpleAlert(title: "", message: "인증 번호 입력 시간을 초과했습니다!")
        verifyBtn.setTitle("다시전송", for: .normal)
        checkView.isHidden = true
            
        }
        
    
    
}
}




