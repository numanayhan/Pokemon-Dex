//
//  PokemonModels.swift
//  Pokemon
//
//  Created by na on 7.12.2022.
//

import Foundation

public struct PokemonResult: Codable {
    let count: Int?
    let results: [Results] 
    public init(count: Int?, results: [Results] ) {
        self.count = count
        self.results = results
    }
}
public struct Results : Codable {
    let name : String
     
    public init(name:String ) {
        self.name = name
    }
}

