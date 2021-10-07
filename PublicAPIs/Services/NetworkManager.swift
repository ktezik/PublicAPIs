//
//  NetworkManager.swift
//  PublicAPIs
//
//  Created by Иван Гришин on 07.10.2021.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from url: String?, with completion: @escaping(PublicAPIs) -> Void) {
        guard let url = URL(string: url ?? "") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let publicAPIs = try JSONDecoder().decode(PublicAPIs.self, from: data)
                DispatchQueue.main.async {
                    completion(publicAPIs)
                }
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
    
    func fetchAPIs(from url: String, completion: @escaping(APIs) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                print(error?.localizedDescription ?? "no description")
                return
            }
            
            do {
                let result = try JSONDecoder().decode(APIs.self, from: data)
                DispatchQueue.main.async {
                    completion(result)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}

