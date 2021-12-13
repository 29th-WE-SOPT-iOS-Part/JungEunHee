//
//  NetworkResult.swift
//  seminar-homework-1
//
//  Created by 정은희 on 2021/11/09.
//

import Foundation

enum NetworkResult<T> {
    
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
