//
//  User.swift
//  homework_4+5
//
//  Created by wookeon on 01/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import ObjectMapper

struct MyCommunity<T: Mappable>: Mappable {
    
    var id: Int32?
    var title: String?
    var detail: String?
    var communityImgList: [T]?
    var today: Bool?
    var userId: String?
    var userProfileImg: String?
    var createdAt: Date?
    var updatedAt: Date?
    var auth: Bool?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        
        id <- map["id"]
        title <- map["title"]
        detail <- map["detail"]
        communityImgList <- map["communityImgList"]
        today <- map["today"]
        userId <- map["userId"]
        userProfileImg <- map["userProfileImg"]
        createdAt <- map["createdAt"]
        updatedAt <- map["updatedAt"]
        auth <- map["auth"]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss.SSSZ"
        
        if let dateString = map["createdAt"].currentValue as? String,
            let _date = dateFormatter.date(from: dateString) {
            createdAt = _date
        }
        if let dateString = map["updatedAt"].currentValue as? String,
            let _date = dateFormatter.date(from: dateString) {
            updatedAt = _date
        }
    }
}
