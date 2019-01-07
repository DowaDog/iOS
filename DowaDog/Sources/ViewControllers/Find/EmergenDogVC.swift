//
//  EmergenDogVC.swift
//  DowaDog
//
//  Created by 조윤영 on 30/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit


class EmergenDogVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var emergenDogList = [EmergenDog]()
    
    @IBOutlet weak var navbar: UINavigationItem!
    var reuseIdentifier = "emergenCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackBtn()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        navbar.title = "긴급동물"
        self.setNavigationBarShadow()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        EmergenDogService.shared.getEmergenDogList(offset: 0, limit: 10) { [weak self]
            (data) in
            guard let `self` = self else {return}
            
            self.emergenDogList = data
            self.collectionView.reloadData()
        }
    }
    
    @IBAction func filterClickAction(_ sender: Any) {
        
        
        let filter = UIStoryboard(name: "Filter", bundle: nil).instantiateViewController(withIdentifier: "FilterVC")
        
        //네비게이션 컨트롤러를 이용하여 push를 해줍니다.
        navigationController?.pushViewController(filter, animated: true)
        
    }
    
}



extension EmergenDogVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return emergenDogList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! EmergenDetailCVCell
        
        let emergenDog = emergenDogList[indexPath.row]
        
        //남은 날짜 d-day 계산 부분
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        
        //        var cal = Calendar.current
        //        var date = Date()
        //        var currentDay = cal.component(.day, from: date)
        //
        //        let dday = currentDay - dateFormatter.emergedog.noticeEddt
        
        //하단에 들어가는 해당 동물 지역과 종
        let region = emergenDog.region
        let kind = emergenDog.kindCd
        
        cell.aboutLabel.text = "[\(region)]\(kind)"
        
        //강아지인지 고양이인지 판단
        if emergenDog.type == "dog"{
            cell.kindImage.image = UIImage(named: "dogIcon1227")
        }else if emergenDog.type == "cat" {
            cell.kindImage.image = UIImage(named: "catIcon1227")
        }
        //암컷 수컷 판단
        if emergenDog.sexCd == "F" {
            cell.sexImage.image = UIImage(named: "womanIcon1227")
        }
        else if emergenDog.sexCd == "M" {
            cell.sexImage.image = UIImage(named: "manIcon1227")
        }
        
        //        let day = emergedog.noticeEddt
        //        cell.dayLabel.text = dateFormatter.string(from:emergedog.)
        //
        //          cell.dateLabel.text = dateFormatter.string(from: board.boardDate ?? Date())
        
        //하트 클릭여부 판단
        cell.heartBtn.setImage(UIImage(named: "findingHeartBtnFill.png"), for: .selected)
        cell.heartBtn.setImage(UIImage(named:"heartBtn"), for: .normal)
        if emergenDog.liked == false{
            
            cell.heartBtn.isSelected = true
            
        }else if emergenDog.liked == true{
            
            cell.heartBtn.isSelected = false
            
        }
        
        return cell
    }
    
}

extension EmergenDogVC: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = self.collectionView.cellForItem(at: indexPath) as!EmergenDetailCVCell
        if indexPath.row == 0{
            if let dvc = storyboard?.instantiateViewController(withIdentifier: "AboutEmergenVC") as? AboutEmergenVC {
                
                //네비게이션 컨트롤러를 이용하여 push를 해줍니다.
                navigationController?.pushViewController(dvc, animated: true)
                
            }
        }
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        
        
        
        //        if indexPath.row == 0{
        //            cell0 = false
        //            unselectedCell.areaImage.image = UIImage(named: "wholeAreaBtnYellow")
        //
        //        }
        
    }
}

extension EmergenDogVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (view.frame.width - 45) / 2
        let height: CGFloat = ((view.frame.width - 45) / 2) * 0.8 + 53
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
}
