//
//  LoginService.swift
//  homework_4+5
//
//  Created by wookeon on 30/11/2018.
//  Copyright © 2018 wookeon. All rights reserved.
//

import Alamofire

struct MyInfoService: APIManager, Requestable {
    
    typealias NetworkData = ResponseObject<MyInfo>
    static let shared = MyInfoService()
    let myInfoURL = url("/api/normal/mypage/myinfo")
    let headers: HTTPHeaders = [
        "Authorization" : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoidGFla3l1bmcwNDAyIiwiaXNzIjoiZG93YWRvZyIsImV4cCI6MTU3ODI4NDQzOH0.MTN9ke4pknmiqwu29Je24mUWn56GVM8OEuCca4HEPqI"
    ]
    
    // 마이페이지 조회
    func getMyInfo(completion: @escaping (ResponseObject<MyInfo>) -> Void) {
        
        gettable(myInfoURL, body: nil, header: headers) { res in
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
    
    func putMyInfo(name: String, phone: String, email: String, birth: String, profileImgFile: UIImage, completion: @escaping (ResponseObject<MyInfo>) -> Void) {
        
        let headers: HTTPHeaders = [
            "Content-Type" : "multipart/form-data",
            "Authorization" : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoidGFla3l1bmcwNDAyIiwiaXNzIjoiZG93YWRvZyIsImV4cCI6MTU3ODI4NDQzOH0.MTN9ke4pknmiqwu29Je24mUWn56GVM8OEuCca4HEPqI"
        ]
        
        Alamofire.upload(multipartFormData: { (multipart) in
            multipart.append(name.data(using: .utf8)!, withName: "name")
            multipart.append(phone.data(using: .utf8)!, withName: "phone")
            multipart.append(email.data(using: .utf8)!, withName: "email")
            multipart.append(birth.data(using: .utf8)!, withName: "birth")
            multipart.append(profileImgFile.jpegData(compressionQuality: 0.5)!, withName: "profileImgFile", fileName: "image.jpeg", mimeType: "image/jpeg")
        }, to: myInfoURL, method: .put,
           headers: headers) { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.responseObject { (res: DataResponse<ResponseObject<MyInfo>>) in
                    switch res.result {
                    case .success(let value):
                        
                        
                        print(".success=========================")
                        print("value: ")
                        print(value)
                        print(".success=========================")
                        
                        
                        completion(value)
                    case .failure(let error):
                        
                        print(".error============================")
                        print("error: ")
                        print(error)
                        print(".error============================")
                    }
                }
                
            case .failure(let err):
                print(err)
            }
        }
    }
}
