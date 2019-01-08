//
//  FilterVC.swift
//  DowaDog
//
//  Created by 조윤영 on 30/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit

protocol sendBackDelegate{
    func dataReceived(type: String, region:String, remainNoticeDate:Int)
}

class FilterVC: UIViewController {
    
    var putType:String  = "개"
    var putRegion:String = "전체 지역"
    var putRemainNoticeDate:Int = 300

    var delegate : sendBackDelegate?
    
    
    @IBOutlet weak var slider: CustomUISlider!
    @IBOutlet weak var dogBtn: UIButton!
    @IBOutlet weak var catBtn: UIButton!
    
    @IBOutlet weak var maxDate: UILabel!
    @IBOutlet weak var allBtn: UIButton!
    @IBOutlet weak var area1Btn: UIButton!
    @IBOutlet weak var area2Btn: UIButton!
    @IBOutlet weak var area3Btn: UIButton!
    @IBOutlet weak var area4Btn: UIButton!
    @IBOutlet weak var area5Btn: UIButton!
    @IBOutlet weak var area7Btn: UIButton!
    @IBOutlet weak var area6Btn: UIButton!
    @IBOutlet weak var area8Btn: UIButton!
    
    @IBOutlet weak var dogLabel: UILabel!
    @IBOutlet weak var catLabel: UILabel!
    
    
    @IBOutlet weak var sendBtn: UIButton!
    var resetItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackBtn()
        
        sendBtn.isEnabled = false
        
        allBtn.isSelected = true
        area1Btn.isSelected = false
        area2Btn.isSelected = false
        area3Btn.isSelected = false
        area4Btn.isSelected = false
        area5Btn.isSelected = false
        area6Btn.isSelected = false
        area7Btn.isSelected = false
        area8Btn.isSelected = false
        
        allBtn.setImage(UIImage(named:"wholeAreaBtnYellow"), for: .normal)
        allBtn.setImage(UIImage(named:"wholeAreaBtnDefault"), for: .selected)
        area1Btn.setImage(UIImage(named:"seoulBtnDefault"), for: .normal)
        area1Btn.setImage(UIImage(named:"seoulBtnYellow"), for: .selected)
        area2Btn.setImage(UIImage(named:"gyeonggilBtnDefault"), for: .normal)
        area2Btn.setImage(UIImage(named:"gyeonggilBtnYellow"), for: .selected)
        area3Btn.setImage(UIImage(named:"incheonBtnDefault"), for: .normal)
        area3Btn.setImage(UIImage(named:"incheonBtnYellow"), for: .selected)
        area4Btn.setImage(UIImage(named:"gangwonBtnDefault"), for: .normal)
        area4Btn.setImage(UIImage(named:"gangwonBtnYellow"), for: .selected)
        area5Btn.setImage(UIImage(named:"chungcheongBtnDefault"), for: .normal)
        area5Btn.setImage(UIImage(named:"chungcheongBtnYellow"), for: .selected)
        area6Btn.setImage(UIImage(named:"jeollaBtnDefault"), for: .normal)
        area6Btn.setImage(UIImage(named:"jeollaBtnYellow"), for: .selected)
        area7Btn.setImage(UIImage(named:"gyeongsangBtnDefault"), for: .normal)
        area7Btn.setImage(UIImage(named:"gyeongsangBtnYellow"), for: .selected)
        area8Btn.setImage(UIImage(named:"jejuBtnDefault"), for: .normal)
        area8Btn.setImage(UIImage(named:"jejuBtnYellow"), for: .selected)
        
     
        
        resetItem = UIBarButtonItem(image:UIImage(named: "filterRefresh.png") , style: .plain, target: self, action: #selector(refreshClicked))
        resetItem.tintColor = UIColor.init(displayP3Red: 119/255, green: 119/255, blue: 119/2515, alpha: 1)
        
        navigationItem.rightBarButtonItems = [resetItem]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    @objc func refreshClicked(){

        sendBtn.isEnabled = false
        sendBtn.backgroundColor = UIColor.init(displayP3Red: 266/255, green: 266/255, blue: 266/255, alpha: 1)
        
        dogBtn.isSelected = false
        catBtn.isSelected = false
        
        //버튼
        allBtn.isSelected = true
        area1Btn.isSelected = false
        area2Btn.isSelected = false
        area3Btn.isSelected = false
        area4Btn.isSelected = false
        area5Btn.isSelected = false
        area6Btn.isSelected = false
        area7Btn.isSelected = false
        area8Btn.isSelected = false

    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        
        maxDate.text = "\(currentValue)일"
        
        if(currentValue == 15){
            maxDate.text = "\(currentValue)일 이상"
        }
        putRemainNoticeDate = currentValue
        
    }
    
    
    @IBAction func areaAllClickAction(_ sender: Any) {
        
       allBtn.isSelected = true
        area1Btn.isSelected = false
         area2Btn.isSelected = false
         area3Btn.isSelected = false
         area4Btn.isSelected = false
         area5Btn.isSelected = false
         area6Btn.isSelected = false
         area7Btn.isSelected = false
         area8Btn.isSelected = false
        
    }
    
    @IBAction func area1ClickAction(_ sender: Any) {
        
       area1Btn.isSelected = true
        allBtn.isSelected = false
        area2Btn.isSelected = false
        area3Btn.isSelected = false
        area4Btn.isSelected = false
        area5Btn.isSelected = false
        area6Btn.isSelected = false
        area7Btn.isSelected = false
        area8Btn.isSelected = false
        
    }
    @IBAction func area2ClickAction(_ sender: Any) {
        
        area2Btn.isSelected = true
        allBtn.isSelected = false
        area1Btn.isSelected = false
        area3Btn.isSelected = false
        area4Btn.isSelected = false
        area5Btn.isSelected = false
        area6Btn.isSelected = false
        area7Btn.isSelected = false
        area8Btn.isSelected = false
    }
    
    @IBAction func area3ClickAction(_ sender: Any) {
        
        area3Btn.isSelected = true
        allBtn.isSelected = false
        area1Btn.isSelected = false
        area2Btn.isSelected = false
        area4Btn.isSelected = false
        area5Btn.isSelected = false
        area6Btn.isSelected = false
        area7Btn.isSelected = false
        area8Btn.isSelected = false
        
    }
    @IBAction func area4ClickAction(_ sender: Any) {
        
        area4Btn.isSelected = true
        allBtn.isSelected = false
        area1Btn.isSelected = false
        area2Btn.isSelected = false
        area3Btn.isSelected = false
        area5Btn.isSelected = false
        area6Btn.isSelected = false
        area7Btn.isSelected = false
        area8Btn.isSelected = false
        
    }
    
    @IBAction func area5ClickAction(_ sender: Any) {
        
        area5Btn.isSelected = true
        allBtn.isSelected = false
        area1Btn.isSelected = false
        area2Btn.isSelected = false
        area3Btn.isSelected = false
        area4Btn.isSelected = false
        area6Btn.isSelected = false
        area7Btn.isSelected = false
        area8Btn.isSelected = false
        
    }
    
    @IBAction func area6ClickAction(_ sender: Any) {
        area6Btn.isSelected = true
        allBtn.isSelected = false
        area1Btn.isSelected = false
        area2Btn.isSelected = false
        area3Btn.isSelected = false
        area4Btn.isSelected = false
        area5Btn.isSelected = false
        area7Btn.isSelected = false
        area8Btn.isSelected = false
        
    }
    
    @IBAction func area7ClickAction(_ sender: Any) {
        
        area7Btn.isSelected = true
        allBtn.isSelected = false
        area1Btn.isSelected = false
        area2Btn.isSelected = false
        area3Btn.isSelected = false
        area4Btn.isSelected = false
        area5Btn.isSelected = false
        area6Btn.isSelected = false
        area8Btn.isSelected = false
        
    }
    
    @IBAction func area8ClickAction(_ sender: Any) {
        
        area8Btn.isSelected = true
        allBtn.isSelected = false
        area1Btn.isSelected = false
        area2Btn.isSelected = false
        area3Btn.isSelected = false
        area4Btn.isSelected = false
        area5Btn.isSelected = false
        area6Btn.isSelected = false
        area7Btn.isSelected = false
        
    }
    
    
    @IBAction func kindAction(_ sender: UIButton) {
        dogBtn.setImage(UIImage(named:"filterDogIconGrey"), for: .normal)
        dogBtn.setImage(UIImage(named:"filterDogIconYellow"), for: .selected)
        catBtn.setImage(UIImage(named:"filterCatIconGrey"), for: .normal)
        catBtn.setImage(UIImage(named:"filterCatIconYellow"), for: .selected)
        
        
        if sender == dogBtn{
            dogBtn.isSelected = true
            
            catBtn.isSelected = false
            dogLabel.textColor = UIColor.init(red: 1, green: 194/255, blue: 51/255, alpha: 1)
            catLabel.textColor =  UIColor.init(red: 119/255, green: 119/255, blue: 119/255, alpha: 1)

                sendBtn.isEnabled = true
               sendBtn.backgroundColor = UIColor.init(displayP3Red: 1, green: 194/255, blue: 51/255, alpha: 1)
            
        }
        else if sender == catBtn{
            
            
            catBtn.isSelected = true
            dogBtn.isSelected = false
            catLabel.textColor = UIColor.init(red: 1, green: 194/255, blue: 51/255, alpha: 1)
            dogLabel.textColor = UIColor.init(red: 119/255, green: 119/255, blue: 119/255, alpha: 1)
            
            
                sendBtn.isEnabled = true
                sendBtn.backgroundColor = UIColor.init(displayP3Red: 1, green: 194/255, blue: 51/255, alpha: 1)
            }
            
        }
    
    
    @IBAction func filterAction(_ sender: Any) {
        
        if catBtn.isSelected == true{
            putType = "고양이"
        }else if dogBtn.isSelected == true{
            putType = "개"
        }else{
             putType = "기타"
        }
        
        if allBtn.isSelected == true{
            putRegion = "전체 지역"
        }else if area1Btn.isSelected == true{
            putRegion  = "서울"
        }else if area2Btn.isSelected == true{
            putRegion  = "경기"
        }else if area3Btn.isSelected == true{
             putRegion  = "인천"
        }else if area4Btn.isSelected == true{
             putRegion  = "강원"
        }else if area5Btn.isSelected == true{
             putRegion  = "충청"
        }else if area6Btn.isSelected == true{
             putRegion = "전라"
        }else if area7Btn.isSelected == true{
             putRegion  = "경상"
        }else if area8Btn.isSelected == true{
             putRegion  = "제주"
        }
        
        
        delegate?.dataReceived(type: putType, region: putRegion, remainNoticeDate: putRemainNoticeDate)
        
        dismiss(animated: true, completion: nil)
 
    }
    
}
