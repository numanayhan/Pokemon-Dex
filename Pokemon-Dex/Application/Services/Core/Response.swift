//
//  Response.swift
//  Pokemon-Dex
//
//  Created by na on 6.12.2022.
//  Copyright © 2022 @ Numan Ayhan. All rights reserved.
//

import Foundation
import PromiseKit
 
public struct ErrorHelpers: Codable {
    public var status: Int?
    public var code: String?
    public var description: String
    public var message: String
    
    public init(status: Int?, code: String?, description: String, message: String) {
        self.status = status
        self.code = code
        self.description = description
        self.message = message
    }
}

public enum Response<T: Codable> {
    case onSuccess(_: T?)
    case onError(_: ErrorHelpers)
}
