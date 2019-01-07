//
//  MyWriteVC.swift
//  DowaDog
//
//  Created by 조윤영 on 05/01/2019.
//  Copyright © 2019 wookeon. All rights reserved.
//

import UIKit

class MyWriteVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var myWriteList = [MyCommunity<CommunityImgList>]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackBtn()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
        print("refresh=========")
        
        
        print("transfer=========")
        MyCommunityService.shared.getMyCommunity() { [weak self]
            (data) in
            guard let `self` = self else {return}
            
            self.myWriteList = data
            
            print("data ===================")
            print(data)
            print("data ===================")
        }
        print("transfer=========")
    }
    
    
}
