//
//  AboutNewDogVC.swift
//  DowaDog
//
//  Created by 조윤영 on 31/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit




class AboutNewDogVC: UIViewController {
var heartClick = false
    
    @IBOutlet weak var adoptBtn: UIButton!
    
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var contentView: UIView!

    
    var heartItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackBtn()
        self.navBarBackgroundAlpha = 0//navbar 투명하게 setup
 
        heartItem = UIBarButtonItem(image:UIImage(named: "heartBtnLine.png") , style: .plain, target: self, action: #selector(heartTapped))
        heartItem.tintColor = UIColor.white
        
        navigationItem.rightBarButtonItems = [heartItem]
        
        
        let panGestureRecongnizer = UIPanGestureRecognizer(target: self, action: #selector(panAction(_ :)))
        
        self.view.addGestureRecognizer(panGestureRecongnizer)
        
        panGestureRecongnizer.delegate = self
    

    }

    
    @objc func heartTapped(){
        if heartClick == false{
            heartItem.image = UIImage(named: "heartBtnFill")
            heartClick = true
        }else{
            heartItem.image = UIImage(named: "heartBtnLine.png")
            heartClick = false
        }
        
    }
    
    
    @objc func panAction (_ sender : UIPanGestureRecognizer){
        
        let velocity = sender.velocity(in: scroll)
        
        if abs(velocity.x) > abs(velocity.y) {
            
//            velocity.x < 0 ? print("left") :  print("right")
            
        }
            
        else if abs(velocity.y) > abs(velocity.x) {
            if velocity.y<0{
                
                
                self.adoptBtn.frame.size.height = 0.0
                self.adoptBtn.setTitle("", for: UIControl.State.normal)
               
            }else{
                
                self.adoptBtn.frame.size.height = 49.0
                self.adoptBtn.setTitle("임보/입양하기", for: UIControl.State.normal)

            }

            
        }

         let offsetY = scroll.contentOffset.y
        if ( offsetY > 170) {
            UIView.animate(withDuration: 0.4, animations: {
                self.navBarBackgroundAlpha = 1//navbar 투명하게 setup
              
                self.heartItem.tintColor = UIColor.init(red: 70/255, green: 70/255, blue: 70/255, alpha: 1)
                
            })

        }else if (offsetY <= 170 ){
            UIView.animate(withDuration: 0.4, animations: {
                self.navBarBackgroundAlpha = 0//navbar 투명하게 setup
                self.heartItem.tintColor = UIColor.white
            })

        }
        
    }

}
extension AboutNewDogVC : UIGestureRecognizerDelegate{

    private func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool{

        return true

    }

}
