//
//  LoginService.swift
//  homework_4+5
//
//  Created by wookeon on 30/11/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import Alamofire

struct MyPageService: APIManager, Requestable {
    
    typealias NetworkData = ResponseObject<MyPage>
    static let shared = MyPageService()
    let myPageURL = url("/api/normal/mypage")
    let headers: HTTPHeaders = [
        "Authorization" : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoidGFla3l1bmcwNDAyIiwiaXNzIjoiZG93YWRvZyIsImV4cCI6MTU3ODI5MjY0MX0.vYv4lH8y-Q_DAinNkJrg3-t3MY5c1qROmBADn-MIMs4"
    ]
    
    // 마이페이지 조회
    func getMyPage(completion: @escaping (ResponseObject<MyPage>) -> Void) {
        
        gettable(myPageURL, body: nil, header: headers) { res in
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
