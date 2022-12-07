//
//  Environment.swift
//  Pokemon-Dex
//
//  Created by na on 6.12.2022.
//  Copyright © 2022 @ Numan Ayhan. All rights reserved.
//

import Foundation

public struct Environment {
    
    private static var ENVIRONMENT = "ENVIRONMENT"
    private static var SERVICE_URL = "SERVICE_URL"
    public static var current = Environment()
    
    public enum NameTarget: String {
        case DEV,PORD
    }
    
    // Name of the environment
    public var name: NameTarget
    
    // Base URL of the environment
    public var host: URL
    
    // Some headers value maybe overwritten by Request's own headers
    public var headers: [String: Any] = [:]
    
    // Cache policy
    public var cachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalAndRemoteCacheData
    
    // Initialize a new Environment
    public init(_ name: String, host: String) {
        self.name = NameTarget(rawValue: name)!
        self.host = URL(string: host)!
    }
    
    // Initialize a new Environment from XCConfig
    public init() {
        let name = Bundle.main.object(forInfoDictionaryKey: Environment.ENVIRONMENT) as! String
        let host = Bundle.main.object(forInfoDictionaryKey: Environment.SERVICE_URL) as! String
         
        self.init(name, host: host)
    }
}
