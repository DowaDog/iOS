//
//  LoginService.swift
//  homework_4+5
//
//  Created by wookeon on 30/11/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import Alamofire

struct UserService: APIManager, Requestable {
    
    typealias NetworkData = ResponseObject<User>
    static let shared = UserService()
    let signUpURL = url("/api/signup")
    let headers: HTTPHeaders = [
        "Content-Type" : "application/json"
    ]
    
    // 이메일 중복검사 api
    func duplicateEmail(email: String, completion: @escaping () -> Void) {
        let queryURL = signUpURL + "/duplicateEmail?email=\(email)"
        
        gettable(queryURL, body: nil, header: nil) { res in
            switch res {
            case .success(let value):
                
                
                
                
                print(".success=========================")
                print("value: ")
                print(value)
                print(".success=========================")
                
                completion()
                
            case .error(let error):
                print(".error============================")
                print("error: ")
                print(error)
                print(".error============================")
            }
        }
    }
    
    
    func duplicateId(id: String, completion: @escaping () -> Void) {
        
        let queryURL = signUpURL + "/duplicateId?id=\(id)"

        let body = [
            "id" : id
        ]
        
        gettable(queryURL, body: body, header: headers) {
            res in
            switch res {
            case .success(let value):
                
                
                print(".success=========================")
                print("value: ")
                print(value)
                print(".success=========================")
                
                completion()
            case .error(let error):
                
                print(".error============================")
                print("error: ")
                print(error)
                print(".error============================")
                
            }
        }
    }
    
}
