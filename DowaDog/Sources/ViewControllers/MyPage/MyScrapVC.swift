//
//  MyScrapVC.swift
//  DowaDog
//
//  Created by 조윤영 on 05/01/2019.
//  Copyright © 2019 wookeon. All rights reserved.
//

import UIKit


class MyScrapVC: UIViewController {
    
    var myScrapList = [MyScrap]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackBtn()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        print("refresh=========")
        
        
        print("transfer=========")
        MyScrapService.shared.getMyScrap() { [weak self]
            
            (data) in
            
            guard let `self` = self else {return}
            
            self.myScrapList = data
            
            
            
            print("data ===================")
            print(data)
            print("data ===================")
            
//            self.collectionView.reloadData()
        }
        print("transfer=========")
    }
    
}
//extension MyScrapVC: UITableViewDelegate{
//
//}
//extension MyScrapVC: UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return 5
//    }
//
//
//}
