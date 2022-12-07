//
//  PokemonInteractor.swift
//  Pokemon
//
//  Created by na on 7.12.2022.
//

import Foundation
enum FetchError: Error {
    case failed
}

protocol BaseInteractor {
    var presenter:BasePresenter? {get set}
    
    func getPokemons()
    
}
class PokemonInteractor: BaseInteractor {
    var presenter: BasePresenter?
    
    func getPokemons() {
        var request = URLRequest(url: URL(string: "https://pokeapi.co/api/v2/pokemon")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
         
        let task = URLSession.shared.dataTask(with: request){ data , _ ,error in
             
            guard let data = data , error == nil else {
                self.presenter?.didFetchItems(with: .failure(FetchError.failed))
                return
            }
            do {
                let response  =  try JSONDecoder().decode(PokemonResult.self, from: data)
                self.presenter?.didFetchItems(with: .success([response]))
            }catch{
                self.presenter?.didFetchItems(with:.failure(FetchError.failed))
            }
        }
        task.resume()
        
    }
}
