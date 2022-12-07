//
//  Core.swift
//  Pokemon-Dex
//
//  Created by na on 6.12.2022.
//  Copyright © 2022 @ Numan Ayhan. All rights reserved.
//

import Foundation
import PromiseKit

public protocol Connect {

}

public extension Connect {
    func connect<T>(request: Request) -> Promise<Response<T>> {
        return ConnectSession.shared.generic(request)
    }
}
 
