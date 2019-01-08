//
//  LoginService.swift
//  homework_4+5
//
//  Created by wookeon on 30/11/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import Alamofire

struct AnimalUserAdoptInoculationService: APIManager, Requestable {
    
    typealias NetworkData = ResponseObject<AdoptAnimalDetail<InoculationList>>
    static let shared = AnimalUserAdoptInoculationService()
    let adoptInoculationURL = url("/api/normal/mypage/adoptAnimals")
    let headers: HTTPHeaders = [
        "Authorization" : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoidGFla3l1bmcwNDAyIiwiaXNzIjoiZG93YWRvZyIsImV4cCI6MTU3ODI4NDQzOH0.MTN9ke4pknmiqwu29Je24mUWn56GVM8OEuCca4HEPqI"
    ]
    
    // 사용자 입양 동물 상세 조회
    func getAdoptAnimalInoculation(adoptAnimalIdx: Int, completion: @escaping ([InoculationList]) -> Void) {
        
        let queryURL = adoptInoculationURL + "/\(adoptAnimalIdx)"
        
        gettable(queryURL, body: nil, header: headers) { res in
            switch res {
            case .success(let value):
                
                print(".success=========================")
                print("value: ")
                print(value)
                print(".success=========================")
                
                
                guard let data = value.data?.inoculationList else {return}
                
                completion(data)
            case .error(let error):
                print(".error============================")
                print("error: ")
                print(error)
                print(".error============================")
            }
        }
    }
}
