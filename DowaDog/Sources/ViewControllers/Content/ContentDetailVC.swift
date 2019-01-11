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
    
    var isEducated:Bool?
    var scrapClick:Bool?
    
    var count:Int?
    var getTitle:String?
    var getImage:String?
    var getScrap:Bool?
    
    var scrapItem:UIBarButtonItem!
    
    @IBOutlet weak var adoptBtn: UIButton!
    
    var id:Int!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var noticeView: UIView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var coverView: UIView!
    
    @IBOutlet weak var countAlert: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.setBackBtn()
        self.navBarBackgroundAlpha = 0.0
        
        scrapItem = UIBarButtonItem(image:UIImage(named: "categoryUnscrabBtn.png") , style: .plain, target: self, action: #selector(scrapTapped))
        scrapItem.tintColor = UIColor.white
        navigationItem.rightBarButtonItems = [scrapItem]
        
        
        if getScrap == false{
            scrapClick = false
        }else if getScrap == true{
            scrapClick = true
        }
        
        
        if isEducated == false{
            
        }else if isEducated == true{
            adoptBtn.alpha = 0.0
        }
        
        noticeView.roundRadius()
        coverView.alpha = 0.0
        alertView.alpha = 0.0
        
        countAlert.text = "4개 중의 \(self.gino(count))개의"
        
        
    }
    
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

    
    @objc func scrapTapped(){
        
        EducationListService.shared.contentScrap(contentIdx: id) {
            (data) in
            
            print("scrap==================")
            print("data: ")
            print(data)
            print("scrap==================")
        
         
            if self.scrapClick == false{
                self.scrapItem.image = UIImage(named: "categoryScrabBtn.png")
                self.scrapClick = true
                    }else{
                self.scrapItem.image = UIImage(named: "categoryUnscrabBtn.png")
                self.scrapClick = false
                    }

        
        }

    }
    
    @IBAction func educationCompleteAction(_ sender: Any) {
        EducationListService.shared.contentComplete(contentIdx: id){
            (data) in
            print("isComplete==================")
            print("data: ")
            print(data)
            print("isComplete==================")
        }
        UIView.animate(withDuration: 0.5, animations: {
            self.coverView.alpha = 0.5
            self.alertView.alpha = 1.0
            
            
        })
        
    }
    
    @IBAction func okBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
     
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
        
            view.title.text = getTitle
            view.mainImage.imageFromUrl(getImage, defaultImgPath: "")
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGFloat {

      
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusablecell, for: indexPath) as! ContentCell

        //동적으로 cell 높이를 지정해보자
        let contentstory = contentList[indexPath.row]
        let approximateWidthOfText = view.frame.width - 24 - 20
        let size = CGSize(width: approximateWidthOfText, height: 500)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]
        let estimatedFrame = NSString(string: contentstory.detail ?? "").boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        
//        let user = users[indexPath.row]
//        let approximateWidthOfText = view.frame.width - 150 - 8
//        let size = CGSize(width: approximateWidthOfText, height: 1000)
//        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)]
//        let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
//        return estimatedFrame.height + 16 + 20
//    }
//}
        return estimatedFrame.height + 20
    }


    
}

