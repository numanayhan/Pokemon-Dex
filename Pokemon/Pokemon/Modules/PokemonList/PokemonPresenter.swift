//
//  PokemonPresenter.swift
//  Pokemon
//
//  Created by na on 7.12.2022.
//

import Foundation
protocol BasePresenter {
    var router : BaseRouter? {get set}
    var interector: BaseInteractor? {get set}
    var view : BaseView? {get set}
    
    func didFetchItems(with result: Result<[PokemonResult],Error>)
}

class PokemonPresenter: BasePresenter{
    var router: BaseRouter?
    var interector: BaseInteractor? {
        didSet{
            interector?.getPokemons()
        }
    }
    var view :  BaseView?
    func didFetchItems(with result: Result<[PokemonResult],Error>){
        switch result {
        case .success(let items):
            view?.updateList(with: items)
        case .failure:
            view?.updateList(with: "Error")
        }
    }
    
}
