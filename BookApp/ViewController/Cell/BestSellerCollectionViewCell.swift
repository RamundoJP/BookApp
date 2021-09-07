//
//  BestSellerCollectionViewCell.swift
//  BookApp
//
//  Created by Ramundo, Juan Pablo on 06/09/2021.
//

import UIKit

class BestSellerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bookImage: UIImageView!
//    @IBOutlet weak var titleLabel: UILabel!
//    @IBOutlet weak var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with book: Book) {
        if let url = URL(string: book.img) {
            bookImage.load(url: url)
        }
//        titleLabel.text = book.title
//        authorLabel.text = book.author
    }
}
