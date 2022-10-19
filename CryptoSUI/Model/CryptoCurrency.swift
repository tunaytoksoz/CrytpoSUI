//
//  CryptoCurrency.swift
//  CryptoSUI
//
//  Created by Tunay Toksöz on 21.09.2022.
//

import Foundation

struct CryptoCurrency : Decodable, Identifiable {
    let id = UUID()
    let symbol : String
    let current_price : Float
    let image : String
    let name : String
    
    private enum CodingKeys : String, CodingKey {
        case symbol = "symbol"
        case current_price = "current_price"
        case image = "image"
        case name = "name"
    }
}
