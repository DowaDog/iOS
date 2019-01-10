//
//  EmergeDogService.swift
//  DowaDog
//
//  Created by 조윤영 on 06/01/2019.
//  Copyright © 2019 wookeon. All rights reserved.
//

import Alamofire

struct HomeService: APIManager, Requestable{
    typealias NetworkData = ResponseObject<Home>
    static let shared = HomeService()
    let homeURL = url("/api/normal/main")
    let headers: HTTPHeaders = [
        "Authorization": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoidGFla3l1bmcwNDAyIiwiaXNzIjoiZG93YWRvZyIsImV4cCI6MTU3ODI4NDQzOH0.MTN9ke4pknmiqwu29Je24mUWn56GVM8OEuCca4HEPqI",
        "Content-Type": "application/x-www-form-urlencoded"
    ]
    
    // 홈 스테이터스 조회
    func getHome(completion: @escaping (ResponseObject<Home>) -> Void) {

        gettable(homeURL, body: nil, header: headers) { res in
            switch res {
            case .success(let value):

                print(".success=========================")
                print("value: ")
                print(value)
                print(".success=========================")

                
                completion(value)
            case .error(let error):
                print(".error============================")
                print("error: ")
                print(error)
                print(".error============================")
            }
        }
    }
    
    func getNews(completion: @escaping (ResponseObject<Home>) -> Void) {
        
        let queryURL = homeURL + "/check"
        
        postable(queryURL, body: nil, header: headers) { res in
            switch res {
            case .success(let value):
                
                print(".success=========================")
                print("value: ")
                print(value)
                print(".success=========================")
                
                
                completion(value)
            case .error(let error):
                print(".error============================")
                print("error: ")
                print(error)
                print(".error============================")
            }
        }
    }
}
