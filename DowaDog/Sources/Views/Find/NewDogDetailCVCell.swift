//
//  NewDogDetailCVCell.swift
//  DowaDog
//
//  Created by 조윤영 on 31/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit

class NewDogDetailCVCell: UICollectionViewCell {
    
    @IBOutlet weak var animalImage: UIImageView!
    
    @IBOutlet weak var heartBtn: UIButton!
    
    @IBOutlet weak var kindImage: UIImageView!
    
    @IBOutlet weak var genderImage: UIImageView!
    
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        animalImage.sectionRound()
    }
    @IBAction func heartClickAction(_ sender: Any) {
        if isClick == false{
            heartBtn.setImage(UIImage(named: "findingHeartBtnFill.png"), for: UIControl.State.normal)
            isClick = true
        }else{
            heartBtn.setImage(UIImage(named: "heartBtn.png"), for: UIControl.State.normal)
            isClick  = false
        }
    }
}
