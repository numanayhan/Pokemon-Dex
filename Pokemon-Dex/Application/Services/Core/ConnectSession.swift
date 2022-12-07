//
//  GenericSession.swift
//  Pokemon-Dex
//
//  Created by na on 6.12.2022.
//  Copyright © 2022 @ Numan Ayhan. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit
 
final public class GenericSession: SessionDelegate , BaseRequest, BaseResponse  {
    
    public static let shared = GenericSession()
    public var sessionManager: Alamofire.Session
    private let dispatchQueue = DispatchQueue(label: "queue", qos: .utility, attributes: [.concurrent])
    
    init() {
        switch Environment.current.name {
        case .DEV:
            sessionManager = Session(configuration: URLSessionConfiguration.ephemeral)
        case .PORD:
             sessionManager = Session(configuration: URLSessionConfiguration.ephemeral)
        default:break
            
        }
    }
    func connect<T>(_ request: Request) -> Promise<Response<T>> {
        return Promise<Response<T>> { (resolver) in
            
            self.sessionManager.request(self.baseRequest(request))
                .validate()
                .responseData(queue: self.dispatchQueue) { response in
                    switch response.result {
                    case .success:
                        self.buildResponse(data: response.data
                                           resolver: resolver)
                    case let .failure(err):
                        resolver.fulfill(self.buildResponse(error: err,
                                                            statusCode: response.response?.statusCode))
                    }
            }
        }
    }
}
