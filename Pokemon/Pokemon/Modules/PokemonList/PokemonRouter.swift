//
//  PokemonRouter.swift
//  Pokemon
//
//  Created by na on 7.12.2022.
//

import Foundation
import UIKit

typealias PokemonEntryPoint = BaseView & UIViewController
protocol BaseRouter{
    var entry:PokemonEntryPoint? {get}
    static func setRouter() -> BaseRouter
}

class PokemonRouter: BaseRouter {
    var entry:PokemonEntryPoint?
    static func setRouter() -> BaseRouter {
        let router = PokemonRouter()
        let view:BaseView = PokemonController()
        var interactor:BaseInteractor = PokemonInteractor()
        var presenter:BasePresenter = PokemonPresenter()
         
        interactor.presenter = presenter
        presenter.view = view
        presenter.interector = interactor
        presenter.router  = router
        router.entry  =  view as? PokemonEntryPoint
        return router
    }
    
     
}
