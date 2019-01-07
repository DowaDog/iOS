//
//  User.swift
//  homework_4+5
//
//  Created by wookeon on 01/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import ObjectMapper

struct MyScrap: Mappable {
    
    var id: Int?
    var title: String?
    var createdAt: Date?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        id <- map["id"]
        title <- map["title"]
        createdAt <- map["createdAt"]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss.SSSZ"
        
        if let dateString = map["createdAt"].currentValue as? String,
            let _date = dateFormatter.date(from: dateString) {
            createdAt = _date
        }
    }
}
