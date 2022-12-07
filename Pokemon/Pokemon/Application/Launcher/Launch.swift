//
//  Launch.swift
//  Pokemon
//
//  Created by na on 7.12.2022.
//

import UIKit

class Launch: UIViewController {
    private let listStatus : UILabel = {
        let label = UILabel()
        label.text = "Pokemons"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.init(name: "SystemBold", size: 20)
        return label
    }()
    weak var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(listStatus)
        listStatus.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil , right: view.rightAnchor, paddingTop: view.frame.height/2 - 50, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: view.frame.width, height: 50)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         startTimer()
    }
    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.66, repeats: false) {  _ in
            self.setRouterRegsiter()
        }
    }
    func stopTimer() {
        timer?.invalidate()
    }
    deinit {
        stopTimer()
    }
    func setRouterRegsiter(){
        
        let router = PokemonRouter.setRouter()
        let initVC = router.entry 
        self.navigationController?.pushViewController(initVC!, animated: true)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
