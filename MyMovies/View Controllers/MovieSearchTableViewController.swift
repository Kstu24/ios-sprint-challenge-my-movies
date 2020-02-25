//
//  MovieSearchTableViewController.swift
//  MyMovies
//
//  Created by Spencer Curtis on 8/17/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MovieSearchTableViewController: UITableViewController, UISearchBarDelegate {
    
    private var addButton: UIButton = UIButton()
    private let buttonTextColor = UIColor.blue
    private let buttonBgColor = UIColor.blue

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        
        movieController.searchForMovie(with: searchTerm) { (error) in
            
            guard error == nil else { return }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieController.searchedMovies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        
        cell.textLabel?.text = movieController.searchedMovies[indexPath.row].title
        
//        addButton.backgroundColor = buttonBgColor
//        addButton.setTitle("Add Movie", for: .normal)
//        addButton.setTitleColor(buttonTextColor, for: .normal)
//        cell.addSubview(addButton)
//        addButton.translatesAutoresizingMaskIntoConstraints = false
//        addButton.topAnchor.constraint(equalTo: cell.topAnchor, constant: 15).isActive = true
//        addButton.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -10).isActive = true
//        addButton.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 300).isActive = true
        
        return cell
    }
    
    var movieController = MovieController()
    
    @IBOutlet weak var searchBar: UISearchBar!
}
