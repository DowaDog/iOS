//
//  User.swift
//  homework_4+5
//
//  Created by wookeon on 01/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import ObjectMapper

struct Mailbox: Mappable {
    
    
    var createdAt: Date?
    var updatedAt: Date?
    var id: Int32?
    var title: String?
    var type: String?
    var complete: Bool?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        
        createdAt <- map["createdAt"]
        updatedAt <- map["updatedAt"]
        id <- map["id"]
        title <- map["title"]
        type <- map["type"]
        complete <- map["complete"]
        
        
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
