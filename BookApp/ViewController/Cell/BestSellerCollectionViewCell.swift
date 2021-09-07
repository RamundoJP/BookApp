//
//  BestSellerCollectionViewCell.swift
//  BookApp
//
//  Created by Ramundo, Juan Pablo on 06/09/2021.
//

import UIKit

class BestSellerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bookImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with book: Book) {
        if let url = URL(string: book.img) {
            bookImage.load(url: url)
        }
    }
}
