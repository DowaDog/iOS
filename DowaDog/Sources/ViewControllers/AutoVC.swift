//
//  AutoVC.swift
//  Alamofire
//
//  Created by 조윤영 on 11/01/2019.
//

import UIKit

class AutoVC: UIViewController {
    
    

    @IBOutlet weak var tableView: UITableView!
//
////    let users: [User] = {
////        let brianUser = User(name: "Voong", username: "@buildthatapp", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!")
////
////        let rayUser = User(name: "Wenderlich", username: "@rwenderlich", bioText: "Ray Wenderlich is an iPhone developer and tweets on topics related to iPhone, software, and gaming. Check out our conference.")
////
////        let kindleCourseUser = User(name: "Course", username: "@kindleCourse", bioText: "This recently released course on https://videos.letsbuildthatapp.com/basic-training provides some excellent guidance on how to use UITableView and UICollectionView.  This course also teaches some basics on the Swift language, for example If Statements and For Loops.  This will be an excellent purchase for you.")
////
////        let soogoon = User(name: "soogoon", username: "@kindleCourse", bioText: "This recently released course on https://videos.letsbuildthatapp.com/basic-training provides some excellent guidance on how to use UITableView and UICollectionView.  This course also teaches some basics on the Swift language, for example If Statements and For Loops.  This will be an excellent purchase for you. This recently released course on https://videos.letsbuildthatapp.com/basic-training provides some excellent guidance on how to use UITableView and UICollectionView.  This course also teaches some basics on the Swift language, for example If Statements and For Loops.  This will be an excellent purchase for you.")
////
////        return [brianUser, rayUser, kindleCourseUser, soogoon]
////    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.tableFooterView = UIView()
//    }
//
//}
//
//extension AutoVC: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return users.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////          let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as! TableViewCell
////        let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell") as! AutoCell
//
////
////        cell.contentText.text = users[indexPath.row].bioText
////        return cell
//    }
//
}

extension AutoVC: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let user = users[indexPath.row]
//        let approximateWidthOfText = view.frame.width - 150 - 8
//        let size = CGSize(width: approximateWidthOfText, height: 1000)
//        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)]
//        let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
//        return estimatedFrame.height + 16 + 20
//    }
}

