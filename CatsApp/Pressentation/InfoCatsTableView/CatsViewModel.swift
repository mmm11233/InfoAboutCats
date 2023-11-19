//
//  CatsViewModel.swift
//  CatsApp
//
//  Created by Mariam Joglidze on 19.11.23.
//

import Foundation
struct CatsViewModel {
    let fact: String
    
    init(cat: Cat) {
        fact = cat.fact 
    }
}

