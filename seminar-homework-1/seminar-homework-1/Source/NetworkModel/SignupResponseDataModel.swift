//
//  SignupResponseDataModel.swift
//  seminar-homework-1
//
//  Created by 정은희 on 2021/11/10.
//

import Foundation

// MARK: - SignUpResponseData
struct SignupResponseData: Codable {
    
    let status: Int
    let success: Bool
    let message: String
    let data: SignupResultData?
}

// MARK: - SignUpResultData
struct SignupResultData: Codable {
    let id: Int
    let name, email: String
}
