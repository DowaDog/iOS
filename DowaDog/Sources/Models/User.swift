//
//  User.swift
//  homework_4+5
//
//  Created by wookeon on 01/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import ObjectMapper

struct User: Mappable {
    
    var email: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        email <- map["email"]
    }
}
