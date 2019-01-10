//
//  Page1VC.swift
//  DowaDog
//
//  Created by 조윤영 on 02/01/2019.
//  Copyright © 2019 wookeon. All rights reserved.
//

import UIKit

class Page1VC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var reuseIdentifier = "Page1CVCell"
    
    

    var educationList = [Education]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData()
        
        
    }

func getData(){
    EducationListService.shared.getEducationList() { [weak self]
        (data) in
        guard let `self` = self else {return}
        
        
        print("education==============================")
        print("data: ")
        print(data)
        print("education==============================")
        
        self.educationList = data
        self.collectionView.reloadData()
        
        
        }
    }
}
extension Page1VC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return educationList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! Page1CVCell
        
        
        let education = educationList[indexPath.item]
        
        cell.cardImage?.imageFromUrl(gsno(education.imgPath), defaultImgPath: "")

        cell.bigTitle.text = gsno(education.title)
        cell.littleTitle.text = gsno(education.subtitle)
        
        
        
        if education.educated == true{
            cell.readCheck?.image = UIImage(named:"completedContents")
        }else if education.educated == false{
            cell.readCheck?.image = UIImage(named:"uncompletedContents")
        }
        return cell
    }
    
}

extension Page1VC: UICollectionViewDelegate{
    
   

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = self.collectionView.cellForItem(at: indexPath) as!Page1CVCell
        
        EducationListService.shared.getEducationList() { [weak self]
            (data) in
            guard let `self` = self else {return}
            

            self.educationList = data
            self.collectionView.reloadData()
            
            let education = self.educationList[indexPath.item]
            
            if let dvc = self.storyboard?.instantiateViewController(withIdentifier: "ContentDetailVC") as? ContentDetailVC {
                
                dvc.id = education.id
                
                    //네비게이션 컨트롤러를 이용하여 push를 해줍니다.
                self.navigationController?.pushViewController(dvc, animated: true)
            }
            
        }
      

    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        
    }
}

extension Page1VC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = view.frame.width - 54
        let height: CGFloat = view.frame.height - 121
        
        
        
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 28
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 28, left: 28, bottom: 10, right: 28)
    }
    
}


