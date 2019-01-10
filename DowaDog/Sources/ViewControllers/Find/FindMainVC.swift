//
//  FindMainVC.swift
//  DowaDog
//
//  Created by 조윤영 on 30/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit

class FindMainVC: UIViewController,sendBackDelegate {
    @IBOutlet weak var collectionView: UICollectionView!

  
    @IBOutlet weak var filterBtn: UIButton!
    
    var  reusablecell = "cell1"
    var   reusablecell2 = "cell2"
    var resusableheader = "header"

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

    }
        
 
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        filterBtn.roundRadius()
        
        
    }
    
   
    @IBAction func storyAction(_ sender: Any) {
        
    }
    
    

    
    @IBAction func searchClickAction(_ sender: Any) {
        
                let filter = UIStoryboard(name: "Filter", bundle: nil).instantiateViewController(withIdentifier: "FilterVC")
        
                //네비게이션 컨트롤러를 이용하여 push를 해줍니다.
                navigationController?.pushViewController(filter, animated: true)
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "action_show"{
            
            let newFilterVC = segue.destination as! NewFilterVC
            newFilterVC.delegate = self
        }
    }
    
    func dataReceived(type: String, region: String, remainNoticeDate: Int){

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}


extension FindMainVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var returnValue = Int()
        
        if section == 0{
            
            returnValue = 0
            
        }
        else if section == 1 {
            returnValue = 2
        }
        else if section == 2 {
            returnValue =  8
        }
        return returnValue
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusablecell, for: indexPath) as! EmergenCVCell
        

        let section = indexPath.section
        
        if section == 0{
            return UICollectionViewCell()
        } else if section == 1 {
            

        } else if section == 2 {

        }
         return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let section = indexPath.section
        
        if section == 0 {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "footer", for: indexPath) as! ImageCRView
            return view
            
            
        }else if section == 1 {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind:UICollectionView.elementKindSectionHeader,
                                                                       withReuseIdentifier: resusableheader,
                                                                       for: indexPath) as! HeaderCRView
           
            view.headerLabel.isHidden = false
            view.headerLabel.text = "긴급"
            view.nextBtn.setTitle("더보기", for: .normal)
            view.nextBtn.tintColor = UIColor.init(displayP3Red: 112/255, green: 112/255, blue: 112.255, alpha: 1)
          view.nextBtn.isHidden = false

            return view
            
            
        }else {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                       withReuseIdentifier: resusableheader,
                                                                       for: indexPath) as! HeaderCRView
            view.headerLabel.text = "새로 구조된 아이들"

            view.nextBtn.isHidden = true
            return view
            
        }
    }
}


extension FindMainVC: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
      
        }
   
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        let section = indexPath.section
        
        if section == 1{

        } else if section == 2{
            }
        
        }
        
        func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
            
        }
}

extension FindMainVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (view.frame.width - 45) / 2
        let height: CGFloat = ((view.frame.width - 45) / 2) * 0.8 + 53
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: view.frame.width, height: 0)
        } else {
            return CGSize(width: view.frame.width, height: 50)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: view.frame.width, height: 246)
        } else {
            return CGSize(width: view.frame.width, height: 0)
        }
    }
}
