//
//  BookService.swift
//  BookApp
//
//  Created by Ramundo, Juan Pablo on 06/09/2021.
//

import Foundation

class BookService: ServiceManagerProtocol {
    
    let booksURI = "https://raw.githubusercontent.com/ejgteja/files/main/books.json"
    let bestSellersURI = "https://raw.githubusercontent.com/ejgteja/files/main/best_sellers.json"
    
    func fetchBooks(completion: @escaping (BookResponse?, Error?) -> Void) {
        
        if let url = URL(string: booksURI) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                guard let data = data else {
                    completion(nil, error)
                    return
                }
                
                let response = try? JSONDecoder().decode(BookResponse.self, from: data)
                completion(response, nil)
                
            }.resume()
        }
        
    }
    
    func fetchBestSellers(completion: @escaping (BestSellers?, Error?) -> Void) {
        
        if let url = URL(string: bestSellersURI) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                guard let data = data else {
                    completion(nil, error)
                    return
                }
                
                let response = try? JSONDecoder().decode(BestSellers.self, from: data)
                completion(response, nil)
                
            }.resume()
        }
        
    }
    
}
