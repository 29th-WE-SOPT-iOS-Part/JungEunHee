//
//  LoginResponseDataModel.swift
//  seminar-homework-1
//
//  Created by 정은희 on 2021/11/09.
//

import Foundation

// MARK: - LoginResponseData
struct LoginResponseData: Codable {
    
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
