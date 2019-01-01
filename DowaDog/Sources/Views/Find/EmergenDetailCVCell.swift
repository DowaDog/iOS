//
//  EmergenDetailCVCell.swift
//  DowaDog
//
//  Created by 조윤영 on 30/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit

class EmergenDetailCVCell: UICollectionViewCell {
    
    @IBOutlet weak var heartBtn: UIButton!
    @IBOutlet weak var animalImage: UIImageView!

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        animalImage.sectionRound()
    }
    @IBAction func heartClickAction(_ sender: Any) {
        if isClick == false{
            heartBtn.setImage(UIImage(named: "likedAnimalHeartBtnFill.png"), for: UIControl.State.normal)
            isClick = true
        }else{
            heartBtn.setImage(UIImage(named: "heartBtn.png"), for: UIControl.State.normal)
            isClick  = false
        }
        
    }
}
