//
//  FilterVC.swift
//  DowaDog
//
//  Created by 조윤영 on 30/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit



var cell0 = true
var cell1 = false
var cell2 = false
var cell3 = false
var cell4 = false
var cell5 = false
var cell6 = false
var cell7 = false
var cell8 = false

class FilterVC: UIViewController {
    
    
    
    @IBOutlet weak var dogBtn: UIButton!
    
    @IBOutlet weak var catBtn: UIButton!
    
    @IBOutlet weak var slider: CustomUISlider!
    @IBOutlet weak var maxDate: UILabel!
    
    let reuseIdentifier = "cellId"
    
    var area = [(UIImage(named: "wholeAreaBtnDefault.png")),
                (UIImage(named: "seoulBtnDefault.png")),
                (UIImage(named: "gyeonggilBtnDefault.png")),
                (UIImage(named: "incheonBtnDefault.png")),
                (UIImage(named: "gangwonBtnDefault.png")),
                (UIImage(named: "chungcheongBtnDefault.png")),
                (UIImage(named: "jeollaBtnDefault.png")),
                (UIImage(named: "gyeongsangBtnDefault.png")),
                (UIImage(named: "jejuBtnDefault.png")),
                ]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackBtn()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        dogBtn.roundRadius()
        catBtn.roundRadius()
        
        //        dogView.dropShadow(color: UIColor.black, opacity: 0.16, offSet: CGSize.init(width: 0, height: 0.1), radius: 10, scale: true)
        
    }
    override func didReceiveMemoryWarning() {
        super .didReceiveMemoryWarning()
        
    }
    
    
    @IBAction func dogSelectedAction(_ sender: UIButton) {
        
        
        sender.setImage(UIImage(named: "filterDogIconYellow.png"), for: UIControl.State.normal)
        catBtn.setImage(UIImage(named: "filterCatIconGrey.png"), for: UIControl.State.normal)
        
        
        
        
        
        
        
    }
    
    @IBAction func catSelectedAction(_ sender: UIButton) {
        
        sender.setImage(UIImage(named: "filterCatIconYellow.png"), for: UIControl.State.normal)
        dogBtn.setImage(UIImage(named: "filterDogIconGrey.png"), for: UIControl.State.normal)
        
        
        
    }
    
    
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        
        maxDate.text = "\(currentValue)일"
        
        if(currentValue == 15){
            maxDate.text = "\(currentValue)일 이상"
        }
    }
    
    
}

extension FilterVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.area.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AreaCollectionViewCell
        
        
        cell.areaImage.image = self.area[indexPath.item]
        //print(self.area[indexPath.row])
        return cell
    }
    
}

extension FilterVC: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        
        
        let cell = self.collectionView.cellForItem(at: indexPath) as! AreaCollectionViewCell
        
        if indexPath.row == 0 {
            if cell0 == true{
                cell.areaImage.image = UIImage(named: "wholeAreaBtnYellow")
                cell0 = false
            }
            else{
                cell.areaImage.image = UIImage(named: "wholeAreaBtnDefault")
                cell0 = true
            }
            
            
        }else if indexPath.row == 1 {
            
            if cell1 == false{
                cell.areaImage.image = UIImage(named: "seoulBtnYellow")
                cell1 = true
                cell0  = false
                
            }
            else{
                cell.areaImage.image = UIImage(named: "seoulBtnDefault")
                cell1 = false
            }
        }else if indexPath.row == 2{
            if cell2 == false{
                cell.areaImage.image = UIImage(named: "gyeonggilBtnYellow")
                cell2 = true
                cell0  = false
            }
            else{
                cell.areaImage.image = UIImage(named: "gyeonggilBtnDefault")
                cell2 = false
            }
            
        }else if indexPath.row == 3 {
            if cell3 == false{
                cell.areaImage.image = UIImage(named: "incheonBtnYellow")
                cell3 = true
                cell0  = false
            }
            else{
                cell.areaImage.image = UIImage(named: "incheonBtnDefault")
                cell3 = false
            }
            
        }else if indexPath.row == 4 {
            if cell4 == false{
                cell.areaImage.image = UIImage(named: "gangwonBtnYellow")
                cell4 = true
                cell0  = false
            }
            else{
                cell.areaImage.image = UIImage(named: "gangwonBtnDefault")
                cell4 = false
            }
            
        }
        else if indexPath.row == 5{
            if cell5 == false{
                cell.areaImage.image = UIImage(named: "chungcheongBtnYellow")
                cell5 = true
                cell0  = false
            }
            else{
                cell.areaImage.image = UIImage(named: "chungcheongBtnDefault")
                cell5 = false
            }
            
        }else if indexPath.row == 6{
            if cell6 == false{
                cell.areaImage.image = UIImage(named: "jeollaBtnYellow")
                cell6 = true
                cell0  = false
            }
            else{
                cell.areaImage.image = UIImage(named: "jeollaBtnDefault")
                cell6 = false
            }
        }else if indexPath.row == 7{
            if cell7 == false{
                cell.areaImage.image = UIImage(named: "gyeongsangBtnYellow")
                cell7 = true
                cell0  = false
            }else{
                cell.areaImage.image = UIImage(named: "gyeongsangBtnDefault")
                cell7 = false
            }
            
        }else if indexPath.row == 8{
            if cell8 == false{
                cell.areaImage.image = UIImage(named: "jejuBtnYellow")
                cell8 = true
                cell0  = false
            }
            else{
                cell.areaImage.image = UIImage(named: "jejuBtnDefault")
                cell8 = false
            }
        }
        
        
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        
        
        let unselectedCell:AreaCollectionViewCell = collectionView.cellForItem(at: indexPath)! as! AreaCollectionViewCell
        
        if indexPath.row == 0{
            cell0 = false
            unselectedCell.areaImage.image = UIImage(named: "wholeAreaBtnYellow")
            
        }
        if indexPath.row == 1{
            
            unselectedCell.areaImage.image = UIImage(named: "seoulBtnDefault")
            cell1 = false
        }
        if indexPath.row == 2{
            unselectedCell.areaImage.image = UIImage(named: "gyeonggilBtnDefault")
            cell2 = false
        }
        if indexPath.row == 3 {
            unselectedCell.areaImage.image = UIImage(named: "incheonBtnDefault")
            cell3 = false
        }
        if indexPath.row == 4{
            unselectedCell.areaImage.image = UIImage(named: "gangwonBtnDefault")
            cell4 = false
        }
        if indexPath.row == 5{
            unselectedCell.areaImage.image = UIImage(named: "chungcheongBtnDefault")
            cell5 = false
        }
        if indexPath.row == 6{
            unselectedCell.areaImage.image = UIImage(named: "jeollaBtnDefault")
            cell6 = false
        }
        if indexPath.row == 7{
            unselectedCell.areaImage.image = UIImage(named: "gyeongsangBtnDefault")
            cell7 = false
        }
        if indexPath.row == 8{
            unselectedCell.areaImage.image = UIImage(named: "jejuBtnDefault")
            cell8 = false
        }
        
        //        unselectedCell.contentView.dropShadow(color: UIColor.black, opacity: 0.16, offSet: CGSize.init(width: 0, height: 0.5), radius: 10, scale: true)
        
    }
}
