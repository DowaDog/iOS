//
//  MainPageVC.swift
//  DowaDog
//
//  Created by 조윤영 on 30/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit

class MainPageVC: UIViewController {
    
    
    @IBOutlet weak var page1CV: UIView!
    @IBOutlet weak var page2CV: UIView!
    
    
    @IBOutlet weak var selectPoint1: UILabel!
    
    @IBOutlet weak var selectPoint2: UILabel!
    
    @IBOutlet weak var leadingC: NSLayoutConstraint!
    @IBOutlet weak var trailingC: NSLayoutConstraint!
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var tab1: UIButton!
    
    @IBOutlet weak var tab2: UIButton!
    
    @IBOutlet weak var coverView: UIView!
    
    //햄버가바 상태 값 변수입니다.
    var menuIsVisible = false {
        didSet { //menuStatus의 값이 변경된 후에 호출됩니다.
            if !menuIsVisible {
                topView.isUserInteractionEnabled = false
                print(topView.isUserInteractionEnabled)
            } else {
                topView.isUserInteractionEnabled = true
                print(topView.isUserInteractionEnabled)
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.setNavigationBar()
        coverView.isHidden=true
        page2CV.alpha = 0.0
        self.selectPoint1.frame.size.height = 8.0//사이즈 변경 안먹힘
        self.selectPoint2.frame.size.height = 0.0//사이즈 변경 안먹힘
        
        
    }
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        switch segue.destination {
    //        case let pvc as PageViewController:
    //            pvc.model = LatinTableDataModel()
    //        case let tvc as TableViewController:
    //            tvc.model = NumericTableDataModel()
    //        default:
    //            break
    //        }
    //    }
    
    
    @IBAction func FirstPageAction(_ sender: Any) {
        
        self.selectPoint1.frame.size.height = 8.0//사이즈 변경 안먹힘
        self.selectPoint2.frame.size.height = 0.0//사이즈 변경 안먹힘
        
        
        
        tab2.setTitleColor(UIColor(red: 154.0/255.0, green: 154.0/255.0, blue: 154.0/255.0, alpha: 1.0), for: .normal)
        tab1.setTitleColor(UIColor.init(red: 255/255, green: 194/255, blue: 51/255, alpha: 1), for: .normal)
        self.page1CV.alpha = 1.0
        self.page2CV.alpha = 0.0
        
        
        
        
        
    }
    
    
    @IBAction func SecondPageAction(_ sender: Any) {
        
        self.selectPoint1.frame.size.height = 0.0//사이즈 변경 안먹힘
        self.selectPoint2.frame.size.height = 8.0//사이즈 변경 안먹힘
        
        tab2.setTitleColor(UIColor.init(red: 255/255, green: 194/255, blue: 51/255, alpha: 1), for: .normal)
        tab1.setTitleColor(UIColor(red: 154.0/255.0, green: 154.0/255.0, blue: 154.0/255.0, alpha: 1.0), for: .normal)
        
        self.page1CV.alpha = 0.0
        self.page2CV.alpha = 1.0
        
        
        
    }
    
    
    
    @IBAction func slidingAction(_ sender: Any) {
        
        if !menuIsVisible { //열리자!
            
            leadingC.constant = 0
            trailingC.constant = 110
            
            menuIsVisible = true
            coverView.isHidden = false
            
            //애니메이션
            UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
            }) { (animationComplete) in
                print("The animation is complete!")
            }
        }
        
    }
    
    @IBAction func closeTest(_ sender: Any) {
        if menuIsVisible == true {
            leadingC.constant = 375
            trailingC.constant = 375
            
            menuIsVisible = false
            coverView.isHidden = true
            
            //애니메이션
            UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
            }) { (animationComplete) in
                print("The animation is complete!")
            }
        }
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        leadingC.constant = 375
        trailingC.constant = 375
        
        menuIsVisible = false
        coverView.isHidden = true
        
        //애니메이션
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (animationComplete) in
            print("The animation is complete!")
        }
        
    }
}
