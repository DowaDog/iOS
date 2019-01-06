//
//  EmergeDogService.swift
//  DowaDog
//
//  Created by 조윤영 on 06/01/2019.
//  Copyright © 2019 wookeon. All rights reserved.
//

import Alamofire

struct EmergeDogService: APIManager, Requestable{
    typealias NetworkData = ResponseArray<EmergenDog>
    static let shared = EmergeDogService()
    let emergeDogURL = url("/api/normal/animals/emergency")
    let header: HTTPHeaders = [
        "Authorization": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoidGFla3l1bmciLCJpc3MiOiJkb3dhZG9nIiwiZXhwIjoxNTc3OTg4NDcyfQ.dZfpU_OPSH6kaVSeumubeDDtmhuhW4w8D_pNUaMn7-U"
    ]
    
    //모든 긴급 동물 게시글 조회 api
    func getEmergeDogList(offset: Int? = 0, limit: Int? = 10, completion: @escaping ([EmergenDog]) -> Void) {
        
//      let queryURL = emergeDogURL + "?offset=\(offset ?? 0)&limit=\(limit ?? 10)"
        
        gettable(emergeDogURL, body: nil, header: header) { res in
            switch res {
            case .success(let value):
                
                print("success======================")
                print("value : ")
                print(value)
                print("success======================")
                
                
                
                guard let emergeDogList = value.data
                    
                else{return}
                completion(emergeDogList)
            case .error(let error):
                
                print("error======================")
                print("error : ")
                print(error)
                print("error======================")
            }
        }
    }
    
    
}
