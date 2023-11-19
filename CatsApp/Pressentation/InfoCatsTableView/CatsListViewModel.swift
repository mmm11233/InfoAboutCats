//
//  CatsListViewModel.swift
//  CatsApp
//
//  Created by Mariam Joglidze on 19.11.23.
//

import Foundation

final class CatsListViewModel {
    
    private var catsService: CatsService
    
    var onReceivedCat: (([CatsViewModel]) -> Void)?
    
    init(
        catsService: CatsService
    ) {
        self.catsService = catsService
    }
    
    func fetchCatsFacts() {
        catsService.fetchCats() { cats in
            DispatchQueue.main.async {
                self.onReceivedCat?(cats.map(CatsViewModel.init))
            }
            
        }
    }
}
