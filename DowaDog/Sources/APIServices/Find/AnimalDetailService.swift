//
//  EmergeDogService.swift
//  DowaDog
//
//  Created by 조윤영 on 06/01/2019.
//  Copyright © 2019 wookeon. All rights reserved.
//

import Alamofire

struct AnimalDetailService: APIManager, Requestable{
    typealias NetworkData = ResponseObject<DogDetail>
    static let shared = AnimalDetailService()
    let dogDetailURL = url("/api/normal/animals")
    let header: HTTPHeaders = [
        "Authorization": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoidGFla3l1bmcwNDAyIiwiaXNzIjoiZG93YWRvZyIsImV4cCI6MTU3ODI4NDQzOH0.MTN9ke4pknmiqwu29Je24mUWn56GVM8OEuCca4HEPqI"
    ]
    
    // 유기동물 상세조회
    func getAnimalDetail(animalIdx: Int, completion: @escaping (DogDetail) -> Void) {
        
        let queryURL = dogDetailURL + "/\(animalIdx)"
        
        gettable(queryURL, body: nil, header: header) { res in
            switch res {
            case .success(let value):
                
                
                print(".success=========================")
                print("value: ")
                print(value)
                print(".success=========================")
                
                guard let data = value.data else {return}
                
                completion(data)
            case .error(let error):
                
                print("error======================")
                print("error : ")
                print(error)
                print("error======================")
            }
        }
    }
    
    func animalLike(animalIdx: Int, completion: @escaping (ResponseObject<DogDetail>) -> Void) {
        
        let queryURL = dogDetailURL + "/\(animalIdx)/likes"
        
        postable(queryURL, body: nil, header: header) { res in
            switch res {
            case .success(let value):
                
                
                print(".success=========================")
                print("value: ")
                print(value)
                print(".success=========================")
                
                completion(value)
            case .error(let error):
                
                print("error======================")
                print("error : ")
                print(error)
                print("error======================")
            }
        }
    }
    
}
