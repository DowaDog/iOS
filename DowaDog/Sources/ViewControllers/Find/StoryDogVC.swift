//
//  StoryDogVC.swift
//  DowaDog
//
//  Created by 조윤영 on 10/01/2019.
//  Copyright © 2019 wookeon. All rights reserved.
//

import UIKit

class StoryDogVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var coverView: UIView!
    
    @IBOutlet weak var popupView: UIView!

    var age:String?
    var tel:String?
    var care:String?
    var start:String?
    var end:String?
    var dogkind:String?
    var happen:String?
    var like:Bool?
    var state:String?
    var region:String?
    var image:String?
    var type:String?
    var gender:String?
    var weight:String?
    var about:String?
    
    
    
    
    var storyImageList : [String]! = []
    
    var id:Int!
    
    
    var  reusablecell = "storyCell"
    var resusableheader = "storyHeader"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.collectionView?.reloadData()
        
        AnimalDetailService.shared.getAnimalDetail(animalIdx: id){
            (data) in
            
            print("data ===================")
            print(data)
            print("data ===================")
            
            self.age = data.age
            self.tel = data.careTel
           self.care = data.careName
            self.end = data.endDate
            self.start = data.startDate
            self.happen = data.happenPlace
            self.dogkind =  data.kindCd
            self.like = data.liked
            self.state = data.processState
            self.region = data.region
            self.image = data.thumbnailImg
            
            self.storyImageList = data.animalStoryList
            self.type = data.type
            self.gender = data.sexCd
            self.weight = data.weight
            self.about = data.specialMark
            

        }
        print("transfer=========")
        
        
        
    }
    
    
}


extension StoryDogVC:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var returnValue = Int()
        
        
        returnValue = storyImageList.count
        
        return returnValue
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusablecell, for: indexPath) as! StoryImageCVCell
        
        
        
        let section = indexPath.section
        
        
        
        if section == 0{
            return UICollectionViewCell()
            
        } else if section == 1 {
            
            
            let story = storyImageList[indexPath.row]
            //데이터 집어넣기 여기서
            cell.storyImage.imageFromUrl(gsno(story), defaultImgPath: "")
            
        }
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: resusableheader, for: indexPath) as! StoryHeader
    
        view.mainImage.imageFromUrl(gsno(image), defaultImgPath: "communityNoimg")
        view.aboutLabel.text = gsno(about)
        view.age.text = "\(self.gsno(age))살"
        
        let getRegion = self.gsno(region)
        let getKind = self.gsno(dogkind)
        
        view.regionKind.text = "[\(getRegion)]\(getKind)"

        //남녀 판단
        if gender == "M" {
            
            view.genderLabel.text = "수컷"
            view.genderIcon.image = UIImage(named: "manIcon1227")
        }else if gender == "F"{
           view.genderLabel.text = "암컷"
           view.genderIcon.image = UIImage(named: "womanIcon1227")
        }else{
           view.genderLabel.text = "-"
            view.genderIcon.image = UIImage(named:"중성화사진")
        }
        view.aboutLabel.text = self.gsno(about)
        
        //type 판단
        if type == "개" {
            view.typeIcon.image = UIImage(named: "dogIcon1227")
        }else if type  == "고양이" {
           view.typeIcon.image = UIImage(named: "catIcon1227")
        }
        view.weight.text =  "\(gsno(weight))kg"

        var  startText:String!
        var endText:String!
        
        if start == nil{
            startText = "-"
        }else{
            startText = start
        }
        
        if  end  == nil{
            endText =  "-"
        }else{
            endText = end
        }
        
        
        view.remainTerm.text = "\(self.gsno(startText))-\(self.gsno(endText))"
        view.findPlace.text = self.gsno(happen)
        
        if state == "notice"{
            view.processState.text = "공고중"
            
        }else if state == "adopt"{
            view.processState.text = "입양 완료"
            
        }else if state == "step" {
            view.processState.text = "입양 진행중"
            
        }else{
            view.processState.text = "-"
        }

        view.processState.text = care
        view.phoneNumb.setTitle(tel, for: .normal)
        
        return view

    }
}

extension StoryDogVC: UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
}

