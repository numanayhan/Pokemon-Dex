//
//  AppDelegate.swift
//  Pokemon-Dex
//
//  Created by na on 6.12.2022.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Thread.sleep(forTimeInterval: 0.0)
        
        
        return true
    }
    func setNavigation(){
        //Window UI
        window = UIWindow(frame: UIScreen.main.bounds)
        //Root App
        rooter = Navigation(window: window!)
        rooter?.startApp()
    }
}

