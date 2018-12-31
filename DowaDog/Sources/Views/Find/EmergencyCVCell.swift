//
//  EmergencyCVCell.swift
//  DowaDog
//
//  Created by 조윤영 on 30/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit

class EmergenCVCell: UICollectionViewCell {
    var isClick = false
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var emerImage: UIImageView!
    
    @IBOutlet weak var heartBtn: UIButton!
    
    @IBOutlet weak var kindImage: UIImageView!
    
    @IBOutlet weak var genderImage: UIImageView!
    
    @IBOutlet weak var aboutLabel: UILabel!
    
    @IBAction func heartClickAction(_ sender: Any) {
        if isClick == false{
            heartBtn.setImage(UIImage(named: "findingHeartBtnFill.png"), for: UIControl.State.normal)
            isClick = true
        }else{
            heartBtn.setImage(UIImage(named: "heartBtn.png"), for: UIControl.State.normal)
            isClick  = false
        }
        
    }
    override func awakeFromNib() {
        super .awakeFromNib()
        
        emerImage.sectionRound()
        
        
        
    }
    
    
    
    //    emerImage.roundCorners(.allCorners, radius: 2, borderColor: UIColor.red, borderWidth: 1) //all corners with red border
}


