//
//  User.swift
//  homework_4+5
//
//  Created by wookeon on 01/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import ObjectMapper

struct CommunityImgList: Mappable {
    
    
    var id: Int32?
    var createdAt: Date?
    var updatedAt: Date?
    var filePath: String?
    var originFileName: String?
    
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        
        id <- map["id"]
        createdAt <- map["createdAt"]
        updatedAt <- map["updatedAt"]
        filePath <- map["filePath"]
        originFileName <- map["originFileName"]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss"
        
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
