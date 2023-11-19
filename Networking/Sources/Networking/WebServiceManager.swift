//
//  WebServiceManager.swift
//  CatsApp
//
//  Created by Mariam Joglidze on 19.11.23.
//

import Foundation

protocol WebServiceManaging: AnyObject {
    func httpGet(url: URL, completion: @escaping ((CatsResponse, Error?) -> Void))
    func httpGet(url: URL, completion: @escaping (Result<CatsResponse, Error>) -> Void)
    
    func httpGet<T: Decodable>(url: URL, completion: @escaping ((Result<T, Error>) -> Void))
}

final class WebServiceManger: WebServiceManaging {
    func httpGet(url: URL, completion: @escaping ((CatsResponse, Error?) -> Void)) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(CatsResponse.self, from: data)
                completion(decoded, error)
            } catch {
                print(error)
            }
        }
        .resume()
    }
    
    func httpGet(url: URL, completion: @escaping (Result<CatsResponse, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(CatsResponse.self, from: data)
                completion(.success(decoded))
            } catch {
                print(error)
                completion(.failure(error))
            }
        }
        .resume()
    }
    
    func httpGet<T: Decodable>(url: URL, completion: @escaping ((Result<T, Error>) -> Void)) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(error))
            }
        }
        .resume()
    }
    
}
