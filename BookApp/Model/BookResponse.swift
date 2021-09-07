//
//  BookResponse.swift
//  BookApp
//
//  Created by Ramundo, Juan Pablo on 06/09/2021.
//

import Foundation

// MARK: - BookResponse
struct BookResponse: Codable {
    let results: Results
}

// MARK: - Results
struct Results: Codable {
    let books: [Book]
}

// MARK: - Book
struct Book: Codable {
    let isbn, title, author: String
    let genre: Sections
    let img: String

    enum CodingKeys: String, CodingKey {
        case isbn, title, author
        case genre, img
    }
}

// MARK: - Welcome
struct BestSellers: Codable {
    let results: BestSellersResults
}

// MARK: - Results
struct BestSellersResults: Codable {
    let bestSellers: [String]

    enum CodingKeys: String, CodingKey {
        case bestSellers = "best_sellers"
    }
}
