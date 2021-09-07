//
//  CollectionTableViewCell.swift
//  BookApp
//
//  Created by Ramundo, Juan Pablo on 06/09/2021.
//

import UIKit

class CollectionTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var bestSellers: [Book] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "BestSellerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "bestSellerCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with books: [Book]) {
        self.bestSellers = books
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    // MARK: - CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bestSellers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bestSellerCell", for: indexPath) as! BestSellerCollectionViewCell
        
        cell.configure(with: bestSellers[indexPath.row])
        
        return cell
    }
}
