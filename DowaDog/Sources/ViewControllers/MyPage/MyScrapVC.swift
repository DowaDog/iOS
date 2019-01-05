//
//  MyScrapVC.swift
//  DowaDog
//
//  Created by 조윤영 on 05/01/2019.
//  Copyright © 2019 wookeon. All rights reserved.
//

import UIKit


class MyScrapVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackBtn()
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
