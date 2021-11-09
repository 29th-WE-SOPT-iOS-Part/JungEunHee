//
//  LoginResponseDataModel.swift
//  seminar-homework-1
//
//  Created by 정은희 on 2021/11/09.
//

import Foundation

// 로그인 request에 대한 response를 담을 파일
// (서버 통신 결과로 받는 응답 body를 디코딩할 데이터 모델)

// MARK: - LoginResponseData
struct LoginResponseData: Codable {
    // Codable -> 데이터를 JSON 데이터 포맷으로 자유롭게 encoding, decoding 할 수 있도록 해주는 프로토콜
    let status: Int
    let success: Bool
    let message: String
    let data: LoginResultData?
}

// MARK: - LoginResultData
struct LoginResultData: Codable {
    let id: Int
    let name, email: String
}
