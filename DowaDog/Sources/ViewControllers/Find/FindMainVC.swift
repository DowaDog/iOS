//
//  FindMainVC.swift
//  DowaDog
//
//  Created by 조윤영 on 30/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit

class FindMainVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var  reusablecell = "cell1"
    var   reusablecell2 = "cell2"
    var resusableheader = "header"
    
    var emerImg = [(UIImage(named: "testcat.png")),
                   (UIImage(named: "testcat.png"))
    ]
    var newImg = [(UIImage(named: "testcat.png")),
                  (UIImage(named: "testcat.png")), (UIImage(named: "testcat.png")), (UIImage(named: "testcat.png"))
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
    }
}

extension FindMainVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var returnValue = Int()
        
        if section == 0{
            
            returnValue = emerImg.count
            
        }
        else if section == 1 {
            returnValue =  newImg.count
            //            returnValue = self.sectionDataSource.count
        }
        return returnValue
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        let cellA:EmergenCVCell = collectionView.dequeueReusableCell(withReuseIdentifier: reusablecell, for: indexPath) as! EmergenCVCell
        let cellB:NewDogCVCell = collectionView.dequeueReusableCell(withReuseIdentifier: reusablecell2, for: indexPath) as! NewDogCVCell
        
        let section = indexPath.section
        
        
        
        if section == 0{
            collectionView.backgroundColor = UIColor.init(displayP3Red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
            cellA.emerImage.image = self.emerImg[indexPath.item]
            
            cell = cellA
            
        }else if section == 1{
            
            cellB.newImage.image = self.newImg[indexPath.item]
            cell = cellB
        }
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        //1
        switch kind {
        //2
        case UICollectionView.elementKindSectionHeader:
            //3
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: resusableheader,
                                                                             for: indexPath) as! HeaderCRView
            let section = indexPath.section
            if section == 0{
                headerView.headerLabel.text = "긴급"
            }else if section == 1 {
                headerView.headerLabel.text = "새로 구조된 아이들"
            }
            
            return headerView
        default:
            //4
            assert(false, "Unexpected element kind")
        }
    }
    
}

extension FindMainVC: UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        
        
        //        let cell = self.collectionView.cellForItem(at: indexPath) as! AreaCollectionViewCell
        
        
        
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        
        
    }
}
