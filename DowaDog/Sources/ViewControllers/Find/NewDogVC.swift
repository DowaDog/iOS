//
//  NewDogVC.swift
//  DowaDog
//
//  Created by 조윤영 on 31/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit

class NewDogVC: UIViewController {

    @IBOutlet weak var navbar: UINavigationItem!
    @IBOutlet weak var collectionView: UICollectionView!
    var reuseIdentifier = "newdogCell"
    var testImg = [(UIImage(named: "testcat.png")),
                   (UIImage(named: "testcat.png")), (UIImage(named: "testcat.png")), (UIImage(named: "testcat.png")),(UIImage(named: "testcat.png")),(UIImage(named: "testcat.png")),(UIImage(named: "testcat.png")),(UIImage(named: "testcat.png")),(UIImage(named: "testcat.png"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        navbar.title = "제 이야기를 들어보실래요?"
        
        self.setBackBtn()
        self.setNavigationBarShadow()
    }
}
extension NewDogVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.testImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! NewDogDetailCVCell
        cell.animalImage.image = self.testImg[indexPath.item]

        return cell
    }
    
}

extension NewDogVC: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = self.collectionView.cellForItem(at: indexPath) as!NewDogDetailCVCell
        
        if indexPath.row == 0{
            if let dvc = storyboard?.instantiateViewController(withIdentifier: "AboutNewDogVC") as? AboutNewDogVC {
                
                //네비게이션 컨트롤러를 이용하여 push를 해줍니다.
                navigationController?.pushViewController(dvc, animated: true)
            }
        }
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        
    }
}

