//
//  NewDog.swift
//  DowaDog
//
//  Created by 조윤영 on 06/01/2019.
//  Copyright © 2019 wookeon. All rights reserved.
//

import ObjectMapper

struct NewDog: Mappable {
    var id:Int?
    var type:String?
    var processState:String?
    var sex:String?
    var startDate: Date?
    var endDate:Date?
    var region: String?
    var mark:String?
    var remainDateState:String?
    var kind:String?
    var age:String?
    var weight:String?
    var thumbnailImg:String?
    var happenPlace: String?
    var careName:String?
    var careTel: String?
    
    var liked:Bool?
    var educationState:Bool?
    var storyImage:String? //다시 배열로 바꿈
    
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        id <- map["id"]
        type <- map["type"]
        processState <- map["processState"]
        sex <- map["sexCd"]
        
        region <- map["region"]
        mark <- map["specialMark"]
        remainDateState <- map["remainDateState"]
        kind <- map["kindCd"]
        age <- map["age"]
        weight <- map["weight"]
        thumbnailImg <- map["thumbnailImg"]
        happenPlace <- map["happenPlace"]
        careName <- map["careName"]
        careTel <- map["careTel"]
        liked <- map["liked"]
        educationState <- map["educationState"]
        storyImage <- map["animalStoryList"]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss.SSSZ"
        
        if let dateStart = map["noticeStdt"].currentValue as? String,
            let _date = dateFormatter.date(from: dateStart) {
            startDate = _date
        }
        if let dateEnd = map["noticeEddt"].currentValue as? String,
            let _date = dateFormatter.date(from: dateEnd) {
            endDate = _date
        }
    }
}
