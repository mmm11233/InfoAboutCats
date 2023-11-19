//
//  Cat.swift
//  CatsApp
//
//  Created by Mariam Joglidze on 18.11.23.
//

import Foundation

public struct CatsResponse: Decodable {
    let results: [Cat]
    
    enum CodingKeys: String, CodingKey {
        case results = "data"
    }
}

public struct Cat: Decodable {
    let fact: String
    
    enum CodingKeys: String, CodingKey {
        case fact = "fact"
    }
}

