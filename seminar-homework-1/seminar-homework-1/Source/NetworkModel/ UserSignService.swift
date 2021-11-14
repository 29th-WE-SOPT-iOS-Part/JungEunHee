//
//   UserSignService.swift
//  seminar-homework-1
//
//  Created by 정은희 on 2021/11/09.
//

import Foundation
import Alamofire

struct UserSignService {
    static let shared = UserSignService()   // 싱글톤 객체 선언 -> 앱 어디서든 접근 가능
    
    // ----- MARK: 로그인 -----

    // 로그인 통신을 할 때 사용하는 함수
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
        
        // 요청서 만드는 부분
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        // responseData -> 데이터 통신 시작
        dataRequest.responseData { DataResponse in
            // DataResponse에 데이터 통신의 결과를 담음
            
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
    
    //  judgeLoginStatus -> 응답 실패로 데이터를 받지 못하는 상태를 분기 처리하기 위한 함수
    private func judgeLoginStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isVaildLoginData(data: data)   // 성공
        case 400: return .pathErr   // 문법 오류
        case 500: return .serverErr // 서버 오류
        default: return .networkFail
        }
    }
    
    // isVaildLoginData -> 데이터 처리를 위한 함수
    private func isVaildLoginData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(LoginResponseData.self, from: data) else {return .pathErr}
        return .success(decodedData)
    }
    
    
    // ----- MARK: 회원가입 -----
    // 회원가입 통신을 할 때 사용하는 함수
    func signUp(name: String,
                email: String,
                password:String,
                completion: @escaping (NetworkResult<Any>) -> (Void)) {
        
        let url = APIConstants.signupURL
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        let body: Parameters = [
            "name" : name,
            "email" : email,
            "password" : password
        ]
        
        // 요청서 만드는 부분
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        // responseData -> 데이터 통신 시작
        dataRequest.responseData { DataResponse in
            // DataResponse에 데이터 통신의 결과를 담음
            
            switch DataResponse.result {
            case .success:
                guard let statusCode = DataResponse.response?.statusCode else {return}
                guard let value = DataResponse.value else {return}
                let networkResult = self.judgeSignupStatus(by: statusCode, value)
                completion(networkResult)
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    
    //  judgeSignupStatus -> 응답 실패로 데이터를 받지 못하는 상태를 분기 처리하기 위한 함수
    private func judgeSignupStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isVaildSignupData(data: data)   // 성공
        case 400: return .pathErr   // 문법 오류
        case 500: return .serverErr // 서버 오류
        default: return .networkFail
        }
    }
    
    // isVaildLoginData -> 데이터 처리를 위한 함수
    private func isVaildSignupData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SignupResultData.self, from: data) else {return .pathErr}
        return .success(decodedData)
    }
}