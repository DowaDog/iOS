//
//  NoResultVC.swift
//  DowaDog
//
//  Created by wookeon on 24/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit

class SearchResultVC: UIViewController {
    
    var navTitle: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        self.setNavigationBar()
        //        self.setBackBtn(color: UIColor(red: 111/255, green: 111/255, blue: 111/255, alpha: 1.0))
        
        
        self.navigationItem.title = "'" + navTitle! + "'에 대한 검색 결과"
    }
}

extension SearchResultVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (view.frame.width - 45) / 2
        let height: CGFloat = 187
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
}
