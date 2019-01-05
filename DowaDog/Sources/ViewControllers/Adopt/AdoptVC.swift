//
//  AdoptVC.swift
//  DowaDog
//
//  Created by 조윤영 on 30/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit

class AdoptVC: UIViewController {
    
    
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var way2Btn: UIButton!
    @IBOutlet weak var way1Btn: UIButton!
    
    var walk = false
    var write = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNavigationBarClear()
        self.setBackBtn()
    }
    
    
    @IBAction func walkAction(_ sender: Any) {
        write = false
        walk = true
        
        nextBtn.backgroundColor = UIColor.init(displayP3Red: 1, green: 194/255, blue: 51/255, alpha: 1)
        
        way1Btn.setBackgroundImage(UIImage(named: "walkingImgCheck.png"), for: .normal)
        
        way2Btn.setBackgroundImage(UIImage(named: "writingImgUncheck.png"), for: .normal)
        
    }
    
    @IBAction func writeAction(_ sender: Any) {
        walk = false
        write = true
        
        nextBtn.backgroundColor = UIColor.init(displayP3Red: 1, green: 194/255, blue: 51/255, alpha: 1)
        way1Btn.setBackgroundImage(UIImage(named: "walkingImgUncheck.png"), for: .normal)
        way2Btn.setBackgroundImage(UIImage(named:"writingImgCheck.png"), for: .normal)
    }
    
    @IBAction func nextBtnAction(_ sender: Any) {
        if walk == true {
            performSegue(withIdentifier: "goDirect", sender: self)
        } else if write == true {
            performSegue(withIdentifier: "goDocument", sender: self)
        }
    }
    
    
}
