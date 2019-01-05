//
//  MyWantDogVC.swift
//  DowaDog
//
//  Created by 조윤영 on 05/01/2019.
//  Copyright © 2019 wookeon. All rights reserved.
//

import UIKit


class MyWantDogVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var reuseIdentifier = "wantCell"
    var testImg = [(UIImage(named: "testcat.png")),
                   (UIImage(named: "testcat.png")), (UIImage(named: "testcat.png")), (UIImage(named: "testcat.png")),(UIImage(named: "testcat.png")),(UIImage(named: "testcat.png")),(UIImage(named: "testcat.png")),(UIImage(named: "testcat.png")),(UIImage(named: "testcat.png"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        self.title = "관심 동물"
        
        self.setBackBtn()
        self.setNavigationBarShadow()
    }
}

extension MyWantDogVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.testImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyWantCVCell
        cell.animalImage.image = self.testImg[indexPath.item]
        
        return cell
    }
    
}

extension MyWantDogVC: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        let cell = self.collectionView.cellForItem(at: indexPath) as!MyWantCVCell
//        if indexPath.row == 0{
//            if let dvc = storyboard?.instantiateViewController(withIdentifier: "AboutNewDogVC") as? AboutNewDogVC {
//
//                //네비게이션 컨트롤러를 이용하여 push를 해줍니다.
//                navigationController?.pushViewController(dvc, animated: true)
//            }
//        }
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        
    }
}

extension MyWantDogVC: UICollectionViewDelegateFlowLayout {
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


