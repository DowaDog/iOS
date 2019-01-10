//
//  ContentDetailVC.swift
//  DowaDog
//
//  Created by 조윤영 on 10/01/2019.
//  Copyright © 2019 wookeon. All rights reserved.
//

import UIKit

class ContentDetailVC: UIViewController {

    var contentList = [Content]()
    var  reusablecell = "cell"
    var resusableheader = "header"
    
    var id:Int!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        EducationDetailContentService.shared.getContentDetail(contentIdx: id) {
            (data) in
            
            print("CardVC content==============================")
            print("data: ")
            print(data)
            print("CardVc content==============================")
            
            self.contentList = data
            self.collectionView.reloadData()
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
}

extension ContentDetailVC :UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return contentList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusablecell, for: indexPath) as! ContentCell
        
        let content = contentList[indexPath.row]
        cell.aboutTextView.text = gsno(content.detail)
        cell.contentImage.imageFromUrl(content.thumnailImg, defaultImgPath: "")
        cell.subTitle.text = gsno(content.title)
        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
   
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! ContentHeader
            return view
        }
    }
    


extension ContentDetailVC: UICollectionViewDelegate{
    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
    }
    
}

extension ContentDetailVC:UICollectionViewDelegateFlowLayout{

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let width: CGFloat = view.frame.width - 158
//        let height: CGFloat = view.frame.height - 121
//
//
//        EducationDetailContentService.shared.getContentDetail(contentIdx: id) {
//            (data) in
//
//            print("CardVC content==============================")
//            print("data: ")
//            print(data)
//            print("CardVc content==============================")
//
//            self.contentList = data
//
//            self.collectionView.reloadData()
//            let content = self.contentList[indexPath.row]
//
//
//            let attributes = [NSAttributedString.Key.font:UIFont.systemFont(ofSize:16)]
//            let estimatedFrame = NSString(string: gsno(content.detail) ?? "").boundingRect( with: size, options: option.usesLineFragmentOrigin, attributes: attributes, context:nil)
//
//            //여기 해결해야함
//            //해결못하면 테이블뷰로 할듯
//
//
//        return estimatedFrame.height + 16 + 20
//
//        }
//
//        return CGSize(width: width, height: height)
//    }
//

    
}

