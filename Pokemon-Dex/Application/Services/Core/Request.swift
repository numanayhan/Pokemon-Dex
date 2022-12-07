//
//  Request.swift
//  Pokemon-Dex
//
//  Created by na on 6.12.2022.
//  Copyright © 2022 @ Numan Ayhan. All rights reserved.
//

import Foundation
import Alamofire

public class Request {
    let method: HTTPMethod
    let path: String
    let payload: Data?
    
    public init(method: HTTPMethod = .post, path: String, payload: Data? = nil) {
        self.method = method
        self.path = path
        self.payload = payload
    }
    
    public init<C>(method: HTTPMethod = .post, path: String, payload: C? = nil) where C: Codable {
        self.method = method
        self.path = path
        do {
            self.payload = try JSONEncoder().encode(payload)
        } catch {
            self.payload = nil
        }
    }
}
