//
//  BookViewModel.swift
//  BookApp
//
//  Created by Ramundo, Juan Pablo on 06/09/2021.
//

import Foundation

protocol ServiceManagerProtocol {
    func fetchBooks(completion : @escaping(BookResponse?, Error?) -> Void)
    func fetchBestSellers(completion : @escaping(BestSellers?, Error?) -> Void)
}

class BookViewModel {

    var serviceManager: ServiceManagerProtocol
    
    let sections: [Sections] = [.BEST_SELLERS, .HISTORY, .SCIENCE, .BUSINESS]
    
    var delegate: BookTVDelegateProtocol?
    
    var books: [Book] = [] {
        didSet {
            delegate?.didFinishFetching()
        }
    }
    
    var bestSellers: [String] = [] {
        didSet {
            delegate?.didFinishFetching()
        }
    }
    
    init(serviceManager: ServiceManagerProtocol) {
        self.serviceManager = serviceManager
    }
    
    func fetchBestSellers() {
        serviceManager.fetchBestSellers(completion: { [weak self] (bestSellers, error) in
            guard error == nil else {
                print("DEBUG: \(error.debugDescription)")
                return
            }
            
            self?.bestSellers = bestSellers?.results.bestSellers ?? []
        })
    }
 
    func fetchBooks() {
        serviceManager.fetchBooks(completion: { [weak self] (bookResponse, error) in
            guard error == nil else {
                print("DEBUG: \(error.debugDescription)")
                return
            }
            
            if let bookResponse = bookResponse {
                self?.books = bookResponse.results.books
            }
        })
    }
}
