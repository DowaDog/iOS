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
    
  
    @IBOutlet weak var cellBackgroundView: UIView!
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var emerImage: UIImageView!
    
    @IBOutlet weak var heartBtn: UIButton!
    

    @IBOutlet weak var kindImage: UIImageView!
    
    @IBOutlet weak var genderImage: UIImageView!
    
    @IBOutlet weak var aboutLabel: UILabel!
    
    
    
    
    
    
    @IBAction func heartClickAction(_ sender: UIButton) {
        
        
        
        if isClick == false{
            heartBtn.setImage(UIImage(named: "likedAnimalHeartBtnFill.png"), for: UIControl.State.normal)
            isClick = true
        }else{
            heartBtn.setImage(UIImage(named: "heartBtn.png"), for: UIControl.State.normal)
            isClick  = false
        }

        
        
//        let contentView = sender.superview
//        let cell = contentView?.sender.superview
//
        
//        let cell = sender.superview as!  UICollectionViewCell
//        let indexPath = self.super.indexPath(for: cell)
    }
    
    override func awakeFromNib() {
        super .awakeFromNib()
        cellBackgroundView.roundRadius()
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.3
        self.layer.masksToBounds = false
        
        
        
        
        
        
        
        
        
//        self.heartBtn.tag = indexPath.row
        
        //
        //        let section = indexPath?.section
        //
        //        if section == 1{
        //
        //            let emergen = emergenDogList[indexPath!.item]
        //            let emergenId = emergen.id
        //
        //            AnimalDetailService.shared.animalLike(animalIdx: emergenId ?? 1){_ in
        //            }
        //        }else if section == 2{
        //            let new = newDogList[indexPath!.item]
        //            let newId = new.id
        //
        //            AnimalDetailService.shared.animalLike(animalIdx: newId ?? 1){_ in
        //
        //            }
        //        }
        
    }
    
    
    
    //    emerImage.roundCorners(.allCorners, radius: 2, borderColor: UIColor.red, borderWidth: 1) //all corners with red border
}


