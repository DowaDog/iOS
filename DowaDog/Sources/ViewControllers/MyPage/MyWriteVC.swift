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
//
//
//    var myWriteList = [Community<CommunityImgList>]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        setBackBtn()
//
//
//        boardTable.dataSource = self
//        boardTable.delegate = self
//
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//
//
//        print("refresh=========")
//
//
//        print("transfer=========")
//
//
//        MyCommunityService.shared.getMyCommunity() { [weak self]
//            (data) in
//            guard let `self` = self else {return}
//
//            self.myWriteList = data
//
//            print("data ===================")
//            print(data)
//            print(data.count)
//            print(self.myWriteList.count)
//            print("data ===================")
//        }
//        print("transfer=========")
//        print("=======check=========")
//        print(myWriteList.count)
//    }
//
//
//}
//
//extension MyWriteVC : UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        print("data Source==========================")
//        print(myWriteList.count)
//        print("data Source==========================")
//
//        let writeData = myWriteList[IndexPath.row]
//
//        return writeData.count
////        return myWriteList.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = boardTable.dequeueReusableCell(withIdentifier: "writeCell") as! MyWriteCell
//
////        let board = myWriteList[indexPath.row]
//        cell.titleLabel.text = writeData[indexPath.row]
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy.MM.dd"
//
////        cell.dateLabel.text = dateFormatter.string(from: board.updatedAt ?? Date())
////        cell.titleLabel.text = gsno(board.title)
//
//        return cell
//    }
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


////////////////////////////////////////
//
//class MyScrapVC: UIViewController {
//
//    var myScrapList = [MyScrap]()
//
//    var reuseIdentifier = "scrapCell"
//
//    @IBOutlet weak var tableView: UITableView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        setBackBtn()
//        tableView.dataSource = self
//        tableView.delegate = self
//
//        self.title = "스크랩"
//
//    }
//
//
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//
//        print("refresh=========")
//
//
//        print("transfer=========")
//
//        getData()
//
//    }
//
//    func getData(){
//
//        MyScrapService.shared.getMyScrap() { [weak self]
//            (data) in
//
//            guard let `self` = self else {return}
//            print("---여기--------------")
//            print(data)
//            print("---여기--------------")
//            self.myScrapList = data
//            self.tableView.reloadData()
//
//        }
//    }
//}
//extension MyScrapVC:UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return myScrapList.count
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ScrapCell
//
//        let scrap = myScrapList[indexPath.row]
//
//        let date: String = gsno(scrap.createdAt)
//
//        let fmt = DateFormatter()
//        fmt.dateFormat = "yyyy.MM.dd"
//
//        let showDate: Date = fmt.date(from:date) ?? Date()
//
//        let afterDate: String = fmt.string(from: showDate)
//
//        cell.titleLabel.text = gsno(scrap.title)
//        cell.dateLabel.text = afterDate
//
//        return cell
//
//
//    }
//}
//extension MyScrapVC:UITableViewDelegate{
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = self.tableView.cellForRow(at: indexPath) as! ScrapCell
//
//        let scrap = myScrapList[indexPath.row]
//
//        let dvc = UIStoryboard(name: "Contents", bundle: nil).instantiateViewController(withIdentifier: "ContentDetailVC") as! ContentDetailVC
//
//        dvc.id = gino(scrap.id)
//
//        //네비게이션 컨트롤러를 이용하여 push를 해줍니다.
//        navigationController?.pushViewController(dvc, animated: true)
//
//    }
//}
//
//
//
//
