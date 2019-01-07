//
//  User.swift
//  homework_4+5
//
//  Created by wookeon on 01/12/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import ObjectMapper

struct AnimalUserAdopt: Mappable {
    
    var id: Int32?
    var name: String?
    var gender: Character?
    var kind: String?
    var birth: Date?
    var weight: Int32?
    var neuterYn: Bool?
    var profileImg: String?
    var adoptType: String?
    

    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        
        id <- map["id"]
        name <- map["name"]
        gender <- map["gender"]
        kind <- map["kind"]
        birth <- map["birth"]
        weight <- map["weight"]
        neuterYn <- map["neuterYn"]
        profileImg <- map["profileImg"]
        adoptType <- map["adoptType"]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let dateString = map["birth"].currentValue as? String,
            let _date = dateFormatter.date(from: dateString) {
            birth = _date
        }
    }
}
