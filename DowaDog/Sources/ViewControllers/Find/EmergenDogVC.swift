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
    
    @IBOutlet weak var navbar: UINavigationItem!
    var reuseIdentifier = "emergenCell"
    var testImg = [(UIImage(named: "testcat.png")),
                  (UIImage(named: "testcat.png")), (UIImage(named: "testcat.png")), (UIImage(named: "testcat.png")),(UIImage(named: "testcat.png")),(UIImage(named: "testcat.png")),(UIImage(named: "testcat.png")),(UIImage(named: "testcat.png")),(UIImage(named: "testcat.png"))
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackBtn()
        collectionView.dataSource = self
        collectionView.delegate = self

        navbar.title = "긴급동물"
        self.setNavigationBarShadow()
    }
    @IBAction func filterClickAction(_ sender: Any) {
        
        
        let filter = UIStoryboard(name: "Filter", bundle: nil).instantiateViewController(withIdentifier: "FilterVC")
        
        //네비게이션 컨트롤러를 이용하여 push를 해줍니다.
        navigationController?.pushViewController(filter, animated: true)
        
    }
}
extension EmergenDogVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.testImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! EmergenDetailCVCell
        cell.animalImage.image = self.testImg[indexPath.item]
        
//        cell.areaImage.image = self.testImg[indexPath.item]
        //print(self.area[indexPath.row])
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
        let height: CGFloat = (view.frame.width - 30) / 2 + 15
        
        //TODO: 이미지 사이즈도 view에 맞춰 동적으로 변경
        
        
        
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


