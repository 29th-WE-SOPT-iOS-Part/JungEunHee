//
//  APIConstants.swift
//  seminar-homework-1
//
//  Created by 정은희 on 2021/11/09.
//

import Foundation

// API 주소를 모아놓는 파일

struct APIConstants {
        
    // MARK: - Base URL
    static let baseURL = "https://asia-northeast3-we-sopt-29.cloudfunctions.net/api"
    
    // MARK: - Feature URL
    static let loginURL = baseURL + "/user/login"
    static let signupURL = baseURL + "/user/signup"
    
}
