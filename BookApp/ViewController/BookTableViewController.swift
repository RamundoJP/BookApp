//
//  BookTableViewController.swift
//  BookApp
//
//  Created by Ramundo, Juan Pablo on 06/09/2021.
//

import UIKit

protocol BookTVDelegateProtocol {
    func didFinishFetching()
}

class BookTableViewController: UITableViewController, BookTVDelegateProtocol {
        
    var bookViewModel = BookViewModel(serviceManager: BookService())
    
    func didFinishFetching() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    let reusableIdentifier = "cell"
    let collectionCeusableIdentifier = "collectionCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookViewModel.delegate = self
        
        configTableView()
        
        bookViewModel.fetchBooks()
        bookViewModel.fetchBestSellers()
    }
    
    func configTableView() {
        self.tableView.register(UINib(nibName: "BookTableViewCell", bundle: nil), forCellReuseIdentifier: reusableIdentifier)
        self.tableView.register(UINib(nibName: "CollectionTableViewCell", bundle: nil), forCellReuseIdentifier: collectionCeusableIdentifier)
        self.tableView.separatorStyle = .none
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return bookViewModel.sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = bookViewModel.sections[section]
        
        if section == .BEST_SELLERS {
            return 1
        } else {
            return bookViewModel.books.filter({ $0.genre == section }).count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = bookViewModel.sections[indexPath.section]
        
        if section == .BEST_SELLERS {
            let cell = tableView.dequeueReusableCell(withIdentifier: collectionCeusableIdentifier, for: indexPath) as! CollectionTableViewCell
            
            let books = bookViewModel.books.filter({ bookViewModel.bestSellers.contains($0.isbn) })
            cell.configure(with: books)
           
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: reusableIdentifier, for: indexPath) as! BookTableViewCell
            let book = bookViewModel.books.filter({ $0.genre == section })[indexPath.row]
            cell.configure(book: book)
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = bookViewModel.sections[indexPath.section]
        return section == .BEST_SELLERS ? 175 : 120
    }
    
    // MARK: - HEADER
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: tableView.frame.height))
        
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width - 15, height: 40))
        label.textColor = UIColor(red: 0.08, green: 0.35, blue: 0.52, alpha: 1.00)
        label.font = UIFont(name: "CaslonCP", size: 20)
        
        let bookSection = bookViewModel.sections[section]
        let booksCount = bookSection == .BEST_SELLERS ? bookViewModel.bestSellers.count : bookViewModel.books.filter({ $0.genre == bookSection }).count
        label.text = "\(bookSection.rawValue): \(booksCount)"
        
        view.addSubview(label)
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
