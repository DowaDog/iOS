//
//  LoginService.swift
//  homework_4+5
//
//  Created by wookeon on 30/11/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import Alamofire

struct LoginService: APIManager, Requestable {
    
    typealias NetworkData = ResponseObject<TokenType<Token>>
    static let shared = LoginService()
    let loginURL = url("/api/auth/login")
    let headers: HTTPHeaders = [
        "Content-Type" : "application/json"
    ]
    
    //로그인 api
    func login(id: String, password: String, completion: @escaping (TokenType<Token>) -> Void) {
        let body = [
            "id" : id,
            "password" : password
            ]
        
        postable(loginURL, body: body, header: headers) { res in
            switch res {
            case .success(let value):
                print(".success=========================")
                print("value: ")
                print(value)
                print(".success=========================")
                
                guard let token = value.data else {return}
                completion(token)
            case .error(let error):
                print(".error============================")
                print("error: ")
                print(error)
                print(".error============================")
            }
        }
    }
    
    
}
