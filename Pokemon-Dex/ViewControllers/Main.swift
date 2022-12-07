//
//  MainViewController.swift
//  Pokemon-Dex
//
//  Created by na on 6.12.2022.
//  Copyright © 2022 @ Numan Ayhan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    public var makeNavigationBarTransparent: Bool = false {
        didSet {
            updateNavigationBarStyle()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = UIInterfaceOrientation.portrait.rawValue;
        UIDevice.current.setValue(value, forKey: "orientation")
        
    }
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateNavigationBarStyle()
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
}
extension MainViewController{
    
    fileprivate func updateNavigationBarStyle() {
        if makeNavigationBarTransparent {
            navigationController?.navigationBar.isTranslucent = true
            navigationController?.navigationBar.shadowImage = UIImage()
            navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationController?.navigationBar.barTintColor = UIColor.clear
        } else {
            navigationController?.navigationBar.isTranslucent = false
            navigationController?.navigationBar.shadowImage = #imageLiteral(resourceName: "TransparentPixel")
            navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationController?.navigationBar.barTintColor = .white
        }
    }
}
