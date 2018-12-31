//
//  AboutNewDogVC.swift
//  DowaDog
//
//  Created by 조윤영 on 31/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit

class AboutNewDogVC: UIViewController {

    @IBOutlet weak var adoptBtn: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNavigationBar()
        self.setBackBtn()
        
        
        let panGestureRecongnizer = UIPanGestureRecognizer(target: self, action: #selector(panAction(_ :)))
        
        self.view.addGestureRecognizer(panGestureRecongnizer)
        
        panGestureRecongnizer.delegate = self

        
        
    }
    @objc func panAction (_ sender : UIPanGestureRecognizer){
        
        let velocity = sender.velocity(in: scrollView)
        
        if abs(velocity.x) > abs(velocity.y) {
            
            velocity.x < 0 ? print("left") :  print("right")
            
        }
            
        else if abs(velocity.y) > abs(velocity.x) {
            if velocity.y<0{
                print("up")
                
                self.adoptBtn.frame.size.height = 0.0
                self.adoptBtn.setTitle("", for: UIControl.State.normal)
               
            }else{
                 print("down")
                self.adoptBtn.frame.size.height = 49.0
                self.adoptBtn.setTitle("임보/입양하기", for: UIControl.State.normal)

            }

            
        }
        
    }
    

    
}
extension AboutNewDogVC : UIGestureRecognizerDelegate{
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool{
        
        return true
        
    }
    
}
