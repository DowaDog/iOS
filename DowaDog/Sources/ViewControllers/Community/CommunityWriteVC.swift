//
//  CommunityWriteVC.swift
//  DowaDog
//
//  Created by wookeon on 29/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit

class CommunityWriteVC: UIViewController {
    
    
    // 제목, 내용, 사진
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    var uploadImgArray: Array<UIImage> = []
    
    // uploadImage Button
    @IBOutlet var btn1: UIButton!
    @IBOutlet var btn2: UIButton!
    @IBOutlet var btn3: UIButton!
    @IBOutlet var btn4: UIButton!
    
    // boxView
    @IBOutlet var imageBox: UIView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    // 이미지 버튼 액션
    @IBAction func imgBtnAction(_ sender: UIButton) {
        
        
    }
    
    // 확인 버튼 액션
    @IBAction func submitBtnAction(_ sender: Any) {
        
        //통신
        
        uploadImgArray = [UIImage(named: "xBtn")!, UIImage(named: "xBtn")!, UIImage(named: "xBtn")!, UIImage(named: "xBtn")!]
        
        
        CommunityWriteService.shared.writeCommunityWrite(title: "샘플입니다.", detail: "테스트", communityImgFiles: uploadImgArray) {
            (data) in
            
            print("data=========================")
            print(data)
            print("data=========================")
        }
        
        
    }
    
    // 취소 버튼 액션
    @IBAction func cancleBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
