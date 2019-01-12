//
//  AdoptDocumentVC.swift
//  DowaDog
//
//  Created by wookeon on 30/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit

class AdoptDocumentVC: UIViewController {

    var id:Int!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNavigationBarClear()
        self.setBackBtn()
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        if let dvc = self.storyboard?.instantiateViewController(withIdentifier: "AdoptDocStep1VC") as?AdoptDocStep1VC {
            
            dvc.id = id
        }
        
    }
    
}
