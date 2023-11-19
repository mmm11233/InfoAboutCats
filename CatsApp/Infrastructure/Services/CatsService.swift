//
//  CatsService.swift
//  CatsApp
//
//  Created by Mariam Joglidze on 19.11.23.
//

import Foundation


public class CatsService {
    private let webServiceManager: WebServiceManaging
    
    init(webServiceManager: WebServiceManaging) {
        self.webServiceManager = webServiceManager
    }
    
    func fetchCats(_ completion: @escaping (([Cat]) -> Void)) {
        guard let url = URL(string: "https://catfact.ninja/facts") else {
            return
        }
        webServiceManager.httpGet(url: url) { (result: Result<CatsResponse, Error>) in
            switch result {
            case let .success(response):
                completion(response.results)
            case let .failure(error):
                print(error)
            }
        }
    }
}
