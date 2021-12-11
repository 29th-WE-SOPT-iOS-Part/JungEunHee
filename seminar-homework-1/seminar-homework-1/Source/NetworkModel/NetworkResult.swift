//
//  NetworkResult.swift
//  seminar-homework-1
//
//  Created by 정은희 on 2021/11/09.
//

import Foundation

// 서버 통신 결과를 처리하기 위한 파일

enum NetworkResult<T> {
    // type parameter <T> 적용 -> 해당 case가 불릴 때마다 타입이 결정되도록 함!
    
    case success(T) // 서버통신 성공
    
    case requestErr(T)  // 요청 오류
    case pathErr    // 경로 오류
    case serverErr(T)  // 서버의 내부적 오류
    
    case networkFail    // 네트워크 연결 실패
}
