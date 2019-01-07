//
//  LoginService.swift
//  homework_4+5
//
//  Created by wookeon on 30/11/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import Alamofire

struct AnimalUserAdoptDetailService: APIManager, Requestable {
    
    
    typealias NetworkData = ResponseObject<AdoptAnimalDetail<AnimalUserAdopt>>
    static let shared = AnimalUserAdoptDetailService()
    let adoptDetailURL = url("/api/normal/mypage/adoptAnimals")
    let headers: HTTPHeaders = [
        "Content-Type" : "application/json",
        "Authorization" : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoidGFla3l1bmcwNDAyIiwiaXNzIjoiZG93YWRvZyIsImV4cCI6MTU3ODI4NDQzOH0.MTN9ke4pknmiqwu29Je24mUWn56GVM8OEuCca4HEPqI"
    ]
    
    // 사용자 입양 동물 상세 조회
    func getAdoptAnimalDetail(adoptAnimalIdx: Int?, completion: @escaping (AnimalUserAdopt) -> Void) {
        
        let queryURL = adoptDetailURL + "/\(adoptAnimalIdx)"
        
        gettable(queryURL, body: nil, header: headers) { res in
            switch res {
            case .success(let value):
                
                print(".success=========================")
                print("value: ")
                print(value)
                print(".success=========================")
                
                
                guard let data = value.data?.animalUserAdopt else {return}
                
                completion(data)
            case .error(let error):
                print(".error============================")
                print("error: ")
                print(error)
                print(".error============================")
            }
        }
    }
    
    // 수정 필요
//    func putAdoptAnimalDetail(adoptAnimalIdx: Int?, name: String, gender: Character, kind: String, birth: Date, weight: Double, neuterYn: Bool,   completion: @escaping (AnimalUserAdopt) -> Void) {
//
//        let queryURL = adoptDetailURL + "/\(adoptAnimalIdx)"
//
//        let body = [
//            "name" : name
//        ]
//
//        puttable(queryURL, body: body)
//    }

}
