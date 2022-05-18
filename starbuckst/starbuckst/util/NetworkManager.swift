//
//  NetworkManager.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/16.
//

import Foundation

// HTTPManager와 JSONConverter를 사용해 HTTP요청을 보내고, 그 결과를 관리하는 클래스
final class NetworkManager {
    
    public static let publicNetworkManager = NetworkManager()
    
    static let identifier = "NetworkManager"
    static let homeDataNotification = "HomeDataNotificationName"
    
    func getHomeData(completion: @escaping (HomeData?) -> Void) {
        HTTPManager.requestGET(url: "https://api.codesquad.kr/starbuckst") { data in
            // get요청의 CompletionHandler로 JSON Decoder를 보냄 : 응답 정보를 Swift객체로 변환하기 위해
            // 응답 정보가 단일객체이면 decodeJson()을, 배열이면 decodeJsonArray()를 사용
            guard let data: HomeData = JSONConverter.decodeJson(data: data) else {
                return
            }
            completion(data)
        }
    }
}
