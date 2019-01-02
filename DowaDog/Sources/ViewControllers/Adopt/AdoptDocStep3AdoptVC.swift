//
//  AdoptDocStep3AdoptVC.swift
//  DowaDog
//
//  Created by wookeon on 02/01/2019.
//  Copyright © 2019 wookeon. All rights reserved.
//

import UIKit

class AdoptDocStep3AdoptVC: UIViewController {

    @IBOutlet var nextBtn: UIButton!
    @IBOutlet var agreeBtn: UIButton!

    let normalColor: UIColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1.0)
    let selectColor: UIColor = UIColor(red: 255/255, green: 194/255, blue: 51/255, alpha: 1.0)


    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func agreeBtnAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected

        sender.setImage(UIImage(named:"adoptingDocumentCheckGrey"), for: .normal)
        sender.setImage(UIImage(named:"adoptingDocumentCheckYellow"), for: .selected)

        if sender.isSelected {
            nextBtn.backgroundColor = selectColor
        } else {
            nextBtn.backgroundColor = normalColor
        }
    }

    @IBAction func nextBtnAction(_ sender: UIButton) {
        if nextBtn.backgroundColor == selectColor {
            performSegue(withIdentifier: "goStep4", sender: self)
        }
    }
}
