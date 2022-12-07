//
//  PokemonController.swift
//  Pokemon
//
//  Created by na on 7.12.2022.
//

import Foundation
import UIKit

protocol BaseView {
    var presenter:PokemonPresenter? {get set}
    func updateList(with pokemons:[PokemonResult])
    func updateList(with error:String)
}

class PokemonController : UIViewController, BaseView{
    
    var presenter: PokemonPresenter?
    private let tableView:UITableView = {
       let tb = UITableView()
        tb.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tb.isHidden = true
        return tb
    }()
    private let listStatus : UILabel = {
       let label = UILabel()
        label.text = "Şuanda bir sorun oluştu. Ama sen yine gel :D"
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    var pokemons:[Results] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.interector?.getPokemons()
        
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        view.backgroundColor = .white
       
        view.addSubview(listStatus)
        listStatus.frame = view.bounds
        
    }
    func updateList(with pokemons: [PokemonResult]) {
        DispatchQueue.main.async {
            for item in pokemons{
                self.pokemons = item.results
            }
            self.tableView.reloadData()
            self.listStatus.isHidden = true
            self.tableView.isHidden = false
        }
    }
    
    func updateList(with error: String) {
        DispatchQueue.main.async {
            self.pokemons = []
            self.listStatus.text = error
            self.tableView.isHidden = true
            self.listStatus.isHidden = false
        }
    }
     
}

extension PokemonController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pokemons.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = pokemons[indexPath.row].name
        return cell
    }
}
extension PokemonController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavigationBar()
    }
    func setNavigationBar(){
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.isHidden = false
        
        if navigationController != nil{
            navigationController?.navigationBar.prefersLargeTitles = true
            view.backgroundColor =  .white
            self.navigationItem.title = "Pokemons"
            self.navigationController?.navigationBar.backItem?.title = " "
            
            self.navigationController!.navigationBar.tintColor  = UIColor.black
             
            navigationController!.navigationBar.titleTextAttributes  = [
                NSAttributedString.Key.foregroundColor: UIColor.black,
            ]
            self.navigationController?.navigationBar.backItem?.title = " "
             
        }
    }
}

