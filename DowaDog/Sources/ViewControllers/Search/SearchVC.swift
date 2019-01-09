//
//  SearchVC.swift
//  DowaDog
//
//  Created by wookeon on 23/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import UIKit

protocol SendDataDelegate {
    func sendData(data: String)
}

class SearchVC: UIViewController {
    
    let flag = true
    var searchFlag = false
    
    var delegate: SendDataDelegate?
    
    @IBOutlet var searchTF: UITextField!
    @IBOutlet var searchBtn: UIButton!
    @IBOutlet var keywordBtn1: keywordButton!
    @IBOutlet var keywordBtn2: keywordButton!
    @IBOutlet var keywordBtn3: keywordButton!
    @IBOutlet var keywordBtn4: keywordButton!
    @IBOutlet var keywordBtn5: keywordButton!
    @IBOutlet var keywordBtn6: keywordButton!
    @IBOutlet var keywordBtn7: keywordButton!
    @IBOutlet var keywordBtn8: keywordButton!
    @IBOutlet var keywordBtn9: keywordButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        self.setNavigationBar()
        //        self.setBackBtn(color: UIColor.init(red: 111/255, green: 112/255, blue: 111/255, alpha: 1.0))
        
        searchTF.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        
        searchTF.clearButtonMode = .whileEditing
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        
        if searchTF.text != "" {
            searchBtn.backgroundColor = UIColor(red: 0/255, green: 218/255, blue: 218/255, alpha: 1.0)
            searchFlag = true
        } else {
            searchBtn.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1.0)
            searchFlag = false
        }
    }
    
    @IBAction func searchBtnAction(_ sender: Any) {
        
        
        if searchFlag == true {
            
            if let data = searchTF.text {
                delegate?.sendData(data: data)
                dismiss(animated: true, completion: nil)
            }
            
            if ( flag == true ) {
                performSegue(withIdentifier: "goResult", sender: self)
            } else {
                performSegue(withIdentifier: "goNoResult", sender: self)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goResult"{
            
            let nextVC = segue.destination as! SearchResultVC
            
            nextVC.navTitle = searchTF.text!
        }
        
        if segue.identifier == "goNoResult" {
            let nextVC = segue.destination as! NoResultVC
            
            nextVC.navTitle = searchTF.text!
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
}
