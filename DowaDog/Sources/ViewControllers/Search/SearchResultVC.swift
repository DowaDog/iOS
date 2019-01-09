//
//  NoResultVC.swift
//  DowaDog
//
//  Created by wookeon on 24/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit

class NoResultVC: UIViewController {
    
    var navTitle: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        self.setNavigationBar()
        //        self.setBackBtn(color: UIColor(red: 111/255, green: 111/255, blue: 111/255, alpha: 1.0))
        
        
        self.navigationItem.title = "'" + navTitle! + "'에 대한 검색 결과"
    }
}
