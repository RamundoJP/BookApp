//
//  BookTableViewCell.swift
//  BookApp
//
//  Created by Ramundo, Juan Pablo on 06/09/2021.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }
    
    func configure(book: Book) {
        if let url = URL(string: book.img) {
            bookImageView.load(url: url)
        }
        titleLabel.text = book.title
        authorLabel.text = book.author
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
