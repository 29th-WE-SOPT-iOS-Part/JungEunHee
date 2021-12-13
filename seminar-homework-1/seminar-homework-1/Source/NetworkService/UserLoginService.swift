//
//  UserLoginService.swift
//  seminar-homework-1
//
//  Created by 정은희 on 2021/11/12.
//

import Foundation

import Alamofire

struct UserLoginService {
    static let shared = UserLoginService()
    
    func login(email: String,
               password:String,
               completion: @escaping (NetworkResult<Any>) -> (Void)) {
        
        let url = APIConstants.loginURL
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        let body: Parameters = [
            "email" : email,
            "password" : password
        ]
        
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { DataResponse in
            
            switch DataResponse.result {
            case .success:
                guard let statusCode = DataResponse.response?.statusCode else {return}
                guard let value = DataResponse.value else {return}
                let networkResult = self.judgeLoginStatus(by: statusCode, value)
                completion(networkResult)
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    
    private func judgeLoginStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        
        switch statusCode {
        case 200: return isValidData(data: data)
        case 400: return isUsedPathErrData(data: data)
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func isValidData(data: Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(LoginResponseData.self, from: data) else {return .pathErr}
        return .success(decodedData)
    }
    
    private func isUsedPathErrData(data: Data)  -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()

        guard let decodedData = try? decoder.decode(LoginResponseData.self, from: data) else {return .pathErr}
        return .requestErr(decodedData)
    }
    
}
