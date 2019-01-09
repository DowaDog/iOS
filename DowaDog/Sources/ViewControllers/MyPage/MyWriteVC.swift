//
//  MyWriteVC.swift
//  DowaDog
//
//  Created by 조윤영 on 05/01/2019.
//  Copyright © 2019 wookeon. All rights reserved.
//

import UIKit

class MyWriteVC: UIViewController {
    
    @IBOutlet weak var boardTable: UITableView!
    
    var myWriteList = [Community<CommunityImgList>]()
    
    var writeData = ["gggggg", "ssssdssss"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackBtn()
        
        
        boardTable.dataSource = self
        boardTable.delegate = self
        
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
            print(data.count)
            print(self.myWriteList.count)
            print("data ===================")
        }
        print("transfer=========")
        print("=======check=========")
        print(myWriteList.count)
    }
    
    
}

extension MyWriteVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("data Source==========================")
        print(myWriteList.count)
        print("data Source==========================")
        
        return writeData.count
//        return myWriteList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = boardTable.dequeueReusableCell(withIdentifier: "writeCell") as! MyWriteCell
        
//        let board = myWriteList[indexPath.row]
        cell.titleLabel.text = writeData[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"

//        cell.dateLabel.text = dateFormatter.string(from: board.updatedAt ?? Date())
//        cell.titleLabel.text = gsno(board.title)
        
        return cell
    }
}

extension MyWriteVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailBoardVC") as! DetailBoardVC
//
//        let board = boardList[indexPath.row]
//
//        detailVC.detailBoardId = board.boardId
//
//        navigationController?.pushViewController(detailVC, animated: true)
    }
}
