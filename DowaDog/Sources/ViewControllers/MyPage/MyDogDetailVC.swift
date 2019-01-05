//
//  MyDogDetailVC.swift
//  DowaDog
//
//  Created by 조윤영 on 04/01/2019.
//  Copyright © 2019 wookeon. All rights reserved.
//

import UIKit

class MyDogDetailVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var femaleBtn: UIButton!
    @IBOutlet weak var doBtn: UIButton!
    @IBOutlet weak var undoBtn: UIButton!
    
    @IBOutlet weak var inject1Btn: UIButton!
    @IBOutlet weak var inject2Btn: UIButton!
    @IBOutlet weak var inject3Btn: UIButton!
    @IBOutlet weak var inject4Btn: UIButton!
    @IBOutlet weak var inject5Btn: UIButton!
    @IBOutlet weak var inject6Btn: UIButton!
    
    var confirmItem:UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        maleBtn.setImage(UIImage(named:"adoptingDocumentCheckDefault"), for: .normal)
        maleBtn.setImage(UIImage(named:"adoptingDocumentCheckYellow"), for: .selected)
        
        femaleBtn.setImage(UIImage(named:"adoptingDocumentCheckDefault"), for: .normal)
        femaleBtn.setImage(UIImage(named:"adoptingDocumentCheckYellow"), for: .selected)
        
        doBtn.setImage(UIImage(named:"adoptingDocumentCheckDefault"), for: .normal)
        doBtn.setImage(UIImage(named:"adoptingDocumentCheckYellow"), for: .selected)
        
        doBtn.isSelected  = false
        undoBtn.isSelected = true
        
        
        maleBtn.isSelected = false
        femaleBtn.isSelected = true
        inject1Btn.isSelected = false
          inject2Btn.isSelected = false
          inject3Btn.isSelected = false
          inject4Btn.isSelected = false
          inject5Btn.isSelected = false
          inject6Btn.isSelected = false
        
        profileImage.circleImageView()
        
        self.title = "개인 정보 수정"
        
        confirmItem = UIBarButtonItem(title: "확인", style: .plain, target: self, action: #selector(confirmTapped))
        confirmItem.tintColor = UIColor.init(displayP3Red: 1, green: 194/255, blue: 51/255, alpha: 1)
        
        navigationItem.rightBarButtonItems = [ confirmItem ]
        
    }
    @objc func confirmTapped(){
        //TODO: 확인 선택 시 일어날 액션
    }

   

    @IBAction func maleAction(_ sender: Any) {
            maleBtn.isSelected = true
            femaleBtn.isSelected = false
    }
    
    @IBAction func femaleAction(_ sender: Any) {
       femaleBtn.isSelected = true
        maleBtn.isSelected = false
    }
    
    @IBAction func doAction(_ sender: Any) {
        doBtn.isSelected = true
        undoBtn.isSelected = false
    }
    
    @IBAction func undoAction(_ sender: Any) {
        doBtn.isSelected = false
        doBtn.isSelected = true
    }
    
    @IBAction func injectAction(_ sender: UIButton) {
        sender.setImage(UIImage(named:"adoptingDocumentCheckDefault"), for: .normal)
        sender.setImage(UIImage(named:"adoptingDocumentCheckYellow"), for: .selected)
        
        if sender == inject1Btn && sender.isSelected == false{
            sender.isSelected = true
        }else if sender == inject1Btn && sender.isSelected == true{
            sender.isSelected = false
        }else if sender == inject2Btn && sender.isSelected == false{
            sender.isSelected = true
        }else if sender == inject2Btn && sender.isSelected == true{
            sender.isSelected = false
        }else if sender == inject3Btn && sender.isSelected == false{
            sender.isSelected = true
        }else if sender == inject3Btn && sender.isSelected == true{
            sender.isSelected = false
        }else if sender == inject4Btn && sender.isSelected == false{
            sender.isSelected = true
        }else if sender == inject4Btn && sender.isSelected == true{
            sender.isSelected = false
        }else if sender == inject5Btn && sender.isSelected == false{
            sender.isSelected = true
        }else if sender == inject5Btn && sender.isSelected == true{
            sender.isSelected = false
        }else if sender == inject6Btn && sender.isSelected == false{
            sender.isSelected = true
        }else if sender == inject6Btn && sender.isSelected == true{
            sender.isSelected = false
        }
        
    }
    
}
