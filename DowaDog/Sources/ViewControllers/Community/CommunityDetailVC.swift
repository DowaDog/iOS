//
//  CommunityDetailVC.swift
//  DowaDog
//
//  Created by wookeon on 05/01/2019.
//  Copyright © 2019 wookeon. All rights reserved.
//

import UIKit

class CommunityDetailVC: UIViewController {
    
    
    var replyList = [Community<CommunityImgList>]()
    var reusablecell = "ReplyCell"

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var userIdTextView: UILabel!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var aboutLabel: UITextView!
    
    
    
    
    var id:Int!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setDetailView()

        tableView.dataSource = self
        tableView.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewWillAppear(animated)
        
        // 댓글 조회
        CommentListService.shared.getCommunityList(communityIdx: 1) {
            (data) in
            
            print(data)
        }
        
        
        // 댓글 작성
        CommentService.shared.postComment(communityIdx: 1, detail: "1") {
            (data) in
            
            print(data)
        }
    }
    
    func setDetailView() {
        CommunityDetailService.shared.getCommunityDetail(communityIdx: id ) {
            (data) in
            
            print("data============================")
            print(data)
            print("data============================")
            
            self.replyList = [data]
            
            self.titleLabel.text = self.gsno(data.title)
            
            self.aboutLabel.text = self.gsno(data.detail)
            
            let date: String = self.gsno(data.createdAt)
            
            let fmt = DateFormatter()
            fmt.dateFormat = "yyyy.MM.dd"
            
            let showDate: Date = fmt.date(from:date) ?? Date()
            
            let afterDate: String = fmt.string(from: showDate)
            
            
            
            self.dateLabel.text = afterDate
            
        self.profileImage.imageFromUrl( self.gsno(data.userProfileImg), defaultImgPath: "")
            
            self.userIdTextView.text = self.gsno(data.userId)
            
            

        }
        
    }

}
extension CommunityDetailVC: UITableViewDelegate{
    
}
extension CommunityDetailVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return replyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reusablecell, for:indexPath) as! ReplyCell
        
        let reply = replyList[indexPath.row]
//        cell.idTextView.text = "gsno(\(reply.userId))"
//        cell.profileImage.imageFromUrl(gsno(reply.userProfileImg), defaultImgPath: "")
//
//
//        cell.timeView.text = gsno(reply.updatedAt)
//        cell.replyTextView.text = gsno(reply.detail)
//        reply.
        
        
        let date: String = gsno(reply.createdAt)
        
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy.MM.dd"
        
        let showDate: Date = fmt.date(from:date) ?? Date()
        
        let afterDate: String = fmt.string(from: showDate)
   
    return cell
    }

}





