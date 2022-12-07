//
//  PokemonListViewController.swift
//  Pokemon-Dex
//
//  Created by na on 6.12.2022.
//  Copyright © 2022 @ Numan Ayhan. All rights reserved.
//

import UIKit

protocol PokemonListRouter: AnyObject {
    func popController()
}
protocol KolayAdresView: AnyObject {
    func onEmptyData()
    func onData()
}

class PokemonListVC: Main  {
    var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView(frame: .zero)
            tableView.allowsSelection = false
            tableView.register(PokemonTableViewCell.self)
        }
    }
    var blankListLabel:UILabel = {
       let label = UILabel()
        
        return label
    }()
    //Presenter
    var presenter = PokemonListPresenter()
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.getPokemonList()
    }

}
extension KolayAdresViewController: KolayAdresView {
    
    func onEmpty() {
        self.tableView.isHidden = true
        self.emptyLabel.isHidden = false
    }
    
    func onData() {
        self.tableView.isHidden = false
        self.emptyLabel.isHidden = true
        self.tableView.reloadData()
    }
}
