//
//  ViewController.swift
//  MoviesList - LoadMore
//
//  Created by Niso on 2/4/19.
//  Copyright © 2019 Niso. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    private var button: UIButton!
    
    private var moviesList: [String:Any]!
    private var moviesData = [Movie]()
    private var number = 1
    private var rowNumber = 3
    private var moviesQuantity:Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup - Get data into moviesList dictionary
        moviesList = Data.getMoviesList()
        
        // Setup - Movies quantity
        moviesQuantity = moviesList.count * 5
        
        // Setup - Load more button
        button = UIButton(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 45))
        button.setTitleColor(.blue, for: .normal)
        button.setTitle("Load more movies", for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getMoviesDataFrom(listNumber: String(number))
    }
    
    // Get data from movies list
    func getMoviesDataFrom(listNumber: String) {
        
        // Get data According to the list number
        if let moviesArray = moviesList[listNumber] as? [[String:Any]] {
            for movie in moviesArray {
                let title = movie["title"] as? String ?? ""
                let image = movie["image"] as! UIImage
                
                moviesData.append(Movie(title: title, image: image))
             }
        }
    }
    
    // TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let movie = moviesData[indexPath.row]
        if let movieCell = cell as? MovieTableViewCell {
            movieCell.setCellWithValuesOf(movie)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let lastSectionIndex = tableView.numberOfSections - 1
        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
        
        // Checks if we're in the last cell
        if indexPath.section == lastSectionIndex && indexPath.row == lastRowIndex && moviesData.count < moviesQuantity {
            
            // Set button at tableView footer
            self.tableView.tableFooterView = button
            self.tableView.tableFooterView?.isHidden = false
            
            // Loading results when button clicked
            button.addTarget(self, action: #selector(loadByDemand), for: .touchUpInside)
        } else {
            // Hide button if there is no more movies data to load
            if moviesData.count == moviesQuantity {
                self.tableView.tableFooterView?.isHidden = true
            }
        }
    }
    
    // Load the next movies list
    @objc func loadByDemand() {
        
        // Increase list number by 1
        self.number += 1
        
        if self.number <= moviesList.count {
            
            getMoviesDataFrom(listNumber: String(number))
            
            self.tableView.reloadData()
            
            // Fix cells jumping when loading data
            self.tableView.scrollToRow(at: [0, rowNumber], at: .middle, animated: false)
            self.rowNumber += 5
        }
    }


}

