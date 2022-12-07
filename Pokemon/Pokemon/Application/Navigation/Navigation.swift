//
//  Navigation.swift
//  Pokemon
//
//  Created by na on 7.12.2022.
//

import Foundation
import UIKit
 

class Navigation {
    private let window : UIWindow?
    init(window: UIWindow ) {
        self.window = window
    }
    func startApp() { 
        window!.rootViewController = UINavigationController(rootViewController: Launch())
        window!.makeKeyAndVisible()
    }
    
}
