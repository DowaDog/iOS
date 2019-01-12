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

    @IBOutlet var tableView: UITableView!
    @IBOutlet var userIdTextView: UILabel!
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var aboutLabel: UITextView!
    @IBOutlet var mainImage: UIImageView!
    
    
    // swipe
    @IBOutlet var leftSwipe: UISwipeGestureRecognizer!
    @IBOutlet var rightSwipe: UISwipeGestureRecognizer!
    
    
    
    
    var imageArray: Array<String>?
    
    var communityIdx: Int?
    var comment: String?
    
    var id:Int!
    
    var imageIndex = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        leftSwipe.direction = .left
        rightSwipe.direction = .right
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        CommunityDetailService.shared.getCommunityDetail(communityIdx: gino(communityIdx)) {
            (data) in
            
            for i in 0..<self.gino(data.communityImgList?.count) {
                self.imageArray?.append(self.gsno(data.communityImgList?[i].filePath))
            }
            
            
            self.userIdTextView.text = data.userId
            self.titleLabel.text = data.title
            self.dateLabel.text = data.createdAt
            self.aboutLabel.text = data.detail
            self.profileImage.imageFromUrl(data.userProfileImg, defaultImgPath: "")
            self.mainImage.imageFromUrl(data.communityImgList?[0].filePath, defaultImgPath: "")
        }
        
        
        
        
        
//        // 댓글 조회
//        CommentListService.shared.getCommunityList(communityIdx: communityIdx!) {
//            (data) in
//
//            print(data)
//        }
        
        
//        // 댓글 작성
//        CommentService.shared.postComment(communityIdx: communityIdx!, detail: comment) {
//            (data) in
//
//            print(data)
//        }
    }
    
    
    
    
    
    
    
    @IBAction func leftSwipeAction(_ sender: UISwipeGestureRecognizer) {
        if imageIndex < gino(imageArray?.count) {
            
            imageIndex += 1
            
            UIView.animate(withDuration: 0.3, animations: {
                self.mainImage.alpha = 0
            })
            
            self.mainImage.imageFromUrl(imageArray?[imageIndex], defaultImgPath: "")
            
            UIView.animate(withDuration: 0.3, animations: {
                self.mainImage.alpha = 1
            })
        }
            
        
            
            
    }
    
    
    @IBAction func rightSwipeAction(_ sender: UISwipeGestureRecognizer) {
        
    }
    
    
}


extension CommunityDetailVC: UITableViewDelegate {
    
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






