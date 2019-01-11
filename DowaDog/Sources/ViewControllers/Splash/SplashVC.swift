//
//  SplashVC.swift
//  DowaDog
//
//  Created by wookeon on 12/01/2019.
//  Copyright © 2019 wookeon. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {

    @IBOutlet var splashImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        UIView.animate(withDuration: 2.4, animations: {
            self.splashImage.alpha = 0
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
