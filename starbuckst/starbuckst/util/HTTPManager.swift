//
//  HTTPManager.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/16.
//

import Foundation
import os

// HTTP 요청을 보내고, 그 결과를 받는 역할
final class HTTPManager {

    static func requestGET(url: String, complete: @escaping (Data) -> ()) {
        guard let validURL = URL(string: url) else { return }

        var urlRequest = URLRequest(url: validURL)
        urlRequest.httpMethod = HTTPMethod.get.description

        URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
            
            guard let data = data else { return }
            guard let response = urlResponse as? HTTPURLResponse,
                                    (200..<300).contains(response.statusCode) else {
                if let response = urlResponse as? HTTPURLResponse {
                    os_log("%@", "\(response.statusCode)")
                }
                return
            }

            complete(data)
        }.resume()
    }

    //Post - encode된 Data를 매개변수로 받아옴
    static func requestPOST(url: String, encodingData: Data, complete: @escaping (Data) -> ()) {
        guard let validURL = URL(string: url) else { return }

        var urlRequest = URLRequest(url: validURL)
        urlRequest.httpMethod = HTTPMethod.post.description
        urlRequest.httpBody = encodingData // GET과 다르게 보낼 데이터를 httpBody에 넣어준다
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("\(encodingData.count)", forHTTPHeaderField: "Content-Length")

        URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
            guard let data = data else { return }
            guard let response = urlResponse as? HTTPURLResponse, (200..<300).contains(response.statusCode) else {
                if let response = urlResponse as? HTTPURLResponse {
                    os_log("%@", "\(response.statusCode)")
                }
                return
            }

            complete(data)
        }.resume()
    }
    
    static func requestPostByFormData(url: String, key: String, value: String, complete: @escaping (Data) -> ()) {
        guard let validURL = URL(string: url) else { return }

        var urlRequest = URLRequest(url: validURL)
        urlRequest.httpMethod = HTTPMethod.post.description
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = "\(key)=\(value)".data(using: .utf8) // POST는 보낼 데이터를 Data로 httpBody에 넣어준다

        URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
            guard let data = data else { return }
            guard let response = urlResponse as? HTTPURLResponse, (200..<300).contains(response.statusCode) else {
                if let response = urlResponse as? HTTPURLResponse {
                    os_log("%@", "\(response.statusCode)")
                }
                return
            }
            complete(data)
        }.resume()
    }
    
    static func requestPATCH(url: String, encodingData: Data, complete: @escaping (Data) -> ()) {
        guard let validURL = URL(string: url) else { return }

        var urlRequest = URLRequest(url: validURL)
        urlRequest.httpMethod = HTTPMethod.patch.description
        urlRequest.httpBody = encodingData
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("\(encodingData.count)", forHTTPHeaderField: "Content-Length")

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else { return }
            guard let response = response as? HTTPURLResponse, (200..<300).contains(response.statusCode) else {
                if let response = response as? HTTPURLResponse{
                    os_log("%@", "\(response.statusCode)")
                }
                return
            }

            complete(data)
        }.resume()
    }

    static func requestDELETE(url: String, encodingData: Data, complete: @escaping (Data) -> ()) {
        guard let validURL = URL(string: url) else { return }
        var urlRequest = URLRequest(url: validURL)
        urlRequest.httpMethod = HTTPMethod.delete.description
        urlRequest.httpBody = encodingData
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else { return }
            guard let response = response as? HTTPURLResponse, (200..<300).contains(response.statusCode) else { return }

            complete(data)
        }.resume()
    }
}
