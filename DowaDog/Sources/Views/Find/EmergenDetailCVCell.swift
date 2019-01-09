//
//  EmergenDetailCVCell.swift
//  DowaDog
//
//  Created by 조윤영 on 30/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit

class EmergenDetailCVCell: UICollectionViewCell {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var heartBtn: UIButton!
    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var kindImage: UIImageView!
    
    @IBOutlet weak var sexImage: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.roundRadius()
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.3
        self.layer.masksToBounds = false
        
        heartBtn.setImage(UIImage(named: "likedAnimalHeartBtnFill.png"), for: UIControl.State.selected)
          heartBtn.setImage(UIImage(named: "heartBtn.png"), for: UIControl.State.normal)
    }
    
    @IBAction func heartClickAction(_ sender: Any) {
        if heartBtn.isSelected == false{
            heartBtn.isSelected = true
        }else{
            heartBtn.isSelected = false
        }
        
    }
}
