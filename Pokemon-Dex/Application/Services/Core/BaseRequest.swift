//
//  BaseRequest.swift
//  Pokemon-Dex
//
//  Created by na on 6.12.2022.
//  Copyright © 2022 @ Numan Ayhan. All rights reserved.
//

import Foundation
protocol BaseRequest {
    
}
extension BaseRequest {
    
    func baseRequest(_ request: Request) -> URLRequest {
        
        var urlRequest = URLRequest(url: getUrl(path: request.path))
        urlRequest.setValue(Locale.current.languageCode, forHTTPHeaderField: "Accept-Language")
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.httpBody = request.payload
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.timeoutInterval = 90
        
        if Environment.current.name == .DEV {
            if let payload = request.payload {
                print("Body: \(String(describing: String(data: payload, encoding: .utf8)))")
            } else {
                print("Body: is empty")
            }
        }
        
        return urlRequest
    }
    
    private func getUrl(path: String) -> URL {
        var path = path
        if path.starts(with: "/") {
            path.removeFirst()
        }
        return Environment.current.host.appendingPathComponent(path)
    }
}
