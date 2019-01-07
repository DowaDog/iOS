//
//  AdoptListVC.swift
//  DowaDog
//
//  Created by 조윤영 on 04/01/2019.
//  Copyright © 2019 wookeon. All rights reserved.
//

import UIKit



class AdoptListVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var adoptList = [AdoptList]()
    
    var reusablecell = "MyDogCell"
    var header = "header"
    
    var testImg = [(UIImage(named: "myPageAdoptingDogImg.png")), (UIImage(named: "myPageAdoptingDogImg.png")), (UIImage(named:"myPageAdoptingCatImg.png")), (UIImage(named: "myPageAdoptingDogImg.png")),(UIImage(named: "myPageAdoptingDogImg.png")),(UIImage(named: "myPageAdoptingDogImg.png")), (UIImage(named: "myPageAdoptingDogImg.png")), (UIImage(named:"myPageAdoptingDogImg.png")), (UIImage(named: "myPageAdoptingDogImg.png")),(UIImage(named: "myPageAdoptingDogImg.png"))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "내가 입양한 동물"
        setBackBtn()
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        print("transfer=========")
        AdoptListService.shared.getAdoptList() { [weak self]
            (data) in
            guard let `self` = self else {return}
            
            self.adoptList = data
            self.collectionView.reloadData()
        }
        print("transfer=========")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "mydog_show" {
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "취소", style: .plain, target: nil, action: nil)
            self.navigationItem.backBarButtonItem?.tintColor = UIColor.init(displayP3Red: 130/255, green: 130/255, blue: 130/255, alpha: 1)
            
        }
    }
    
}

extension AdoptListVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                   withReuseIdentifier: header,
                                                                   for: indexPath) as! MyDogCRView
        
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusablecell, for: indexPath) as! MyDogCell
        
        cell.cardImage.image = self.testImg[indexPath.item]
        return cell
        
    }
    
    
}

extension AdoptListVC: UICollectionViewDelegate{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        //        if let dvc = storyboard?.instantiateViewController(withIdentifier: "MyDogDetailVC") as? MyDogDetailVC{
        //
        //            //네비게이션 컨트롤러를 이용하여 push를 해줍니다.
        //            navigationController?.pushViewController(dvc, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
}



extension AdoptListVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = view.frame.width/1.16
        let height: CGFloat = view.frame.height / 4.94
        
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
    }
}
