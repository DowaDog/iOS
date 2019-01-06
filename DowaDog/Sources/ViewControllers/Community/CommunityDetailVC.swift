//
//  CommunityDetailVC.swift
//  DowaDog
//
//  Created by wookeon on 05/01/2019.
//  Copyright © 2019 wookeon. All rights reserved.
//

import UIKit

class CommunityDetailVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var reusableheader = "postHeader" //To승언: reusableview의 storyboard identifier
    var reusablecell = "replyCell" //To승언: 댓글 담을 cell의 identifier
    var replyData = ["111111111111111111111111111111111111111111111111111","222222222222222222222222222222222222222222222222222222222222222222222","3333333333"]
    //To승언: 가상으로 넣어둔 데이터
    

    var newImg = [(UIImage(named: "testcat.png")),
                  (UIImage(named: "testcat.png")), (UIImage(named: "testcat.png")), (UIImage(named: "testcat.png")),(UIImage(named: "testcat.png")),
                  (UIImage(named: "testcat.png")), (UIImage(named: "testcat.png")), (UIImage(named: "testcat.png"))
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self

//        self.setNavigationBarShadow()
    

    }

}

extension CommunityDetailVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        

           return replyData.count
            //MARK: 데이터 받아와서 통신 붙이는 곳
        
   
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusablecell, for: indexPath) as! PostCVCell
        
//        cell.replyTextView.text = replyData[indexPath.item]
        cell.userImage.image = newImg[indexPath.item]
    
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
//        let section = indexPath.section

            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reusableheader, for: indexPath) as! PostCRView
 
           return view
    }
    
}

extension CommunityDetailVC: UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        let section = indexPath.section
//        if section == 2{
//
//            let cell = self.collectionView.cellForItem(at: indexPath) as! PostCVCell
//            if indexPath.row == 0{
//                if let dvc = storyboard?.instantiateViewController(withIdentifier: "NewDogVC") as? NewDogVC {
//
//                    //네비게이션 컨트롤러를 이용하여 push를 해줍니다.
//                    navigationController?.pushViewController(dvc, animated: true)
//                }
//            }
//
//
//        }
        
        func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
            
        }
    }
 
}
extension CommunityDetailVC: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = collectionView.frame.width
        
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusablecell, for: indexPath) as! PostCVCell
        
        //여기서부터 collectionView Cell 높이 동적으로 주는 코드
        
        let height: CGFloat = cell.replyTextView.frame.height + 10
        return CGSize(width: width, height: height)
    }

}
