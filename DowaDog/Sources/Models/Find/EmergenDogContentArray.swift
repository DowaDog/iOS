//
//  EmergenDog.swift
//  DowaDog
//
//  Created by 조윤영 on 06/01/2019.
//  Copyright © 2019 wookeon. All rights reserved.
//
import ObjectMapper

struct EmergenDogContentArray<T: Mappable> : Mappable {
    
    var content: [T]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        content <- map ["content"]
    }
}
