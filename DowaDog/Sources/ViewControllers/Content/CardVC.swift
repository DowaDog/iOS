//
//  CardVC.swift
//  DowaDog
//
//  Created by 조윤영 on 02/01/2019.
//  Copyright © 2019 wookeon. All rights reserved.
//

import UIKit

class CardVC: UIViewController {
    var scrapClick = false
    var scrapItem: UIBarButtonItem!
    
    
    @IBOutlet weak var completeBtn: UIButton!
    
    @IBOutlet weak var scroll: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navBarBackgroundAlpha = 0
        setBackBtn()
        
        scrapItem = UIBarButtonItem(image:UIImage(named: "categoryUnscrabBtn.png") , style: .plain, target: self, action: #selector(heartTapped))
        scrapItem.tintColor = UIColor.white
        
        navigationItem.rightBarButtonItems = [scrapItem]
        
        
        let panGestureRecongnizer = UIPanGestureRecognizer(target: self, action: #selector(panAction(_ :)))
        
        self.view.addGestureRecognizer(panGestureRecongnizer)
        
        panGestureRecongnizer.delegate = self
        
        
    }
    
    
    @objc func heartTapped(){
        if scrapClick == false{
            scrapItem.image = UIImage(named: "categoryScrabBtn.png")
            scrapClick = true
        }else{
            scrapItem.image = UIImage(named: "categoryUnscrabBtn.png")
            scrapClick = false
        }
        
    }
    
    
    @objc func panAction (_ sender : UIPanGestureRecognizer){
        
        let velocity = sender.velocity(in: scroll)
        
        if abs(velocity.x) > abs(velocity.y) {
            
    
            
        }
            
        else if abs(velocity.y) > abs(velocity.x) {
          
        let offsetY = scroll.contentOffset.y
        if ( offsetY > 276) {
            UIView.animate(withDuration: 0.4, animations: {
                self.navBarBackgroundAlpha = 1//navbar 투명하게 setup
                
                self.scrapItem.tintColor = UIColor.init(red: 70/255, green: 70/255, blue: 70/255, alpha: 1)
                
            })
            
        }else if (offsetY <= 276 ){
            UIView.animate(withDuration: 0.4, animations: {
                self.navBarBackgroundAlpha = 0//navbar 투명하게 setup
                self.scrapItem.tintColor = UIColor.white
            })
            
        }
        
    }
    
}
}
extension CardVC : UIGestureRecognizerDelegate{
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool{
        
        return true
        
    }
    
}
