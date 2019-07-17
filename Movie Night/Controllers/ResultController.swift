//
//  ResultController.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 16.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import UIKit

class ResultController: UITableViewController {
    
    let delegate = MovieDelegate(data: Stub.movies)
    let dataSource = MovieDatasource(data: Stub.movies)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup
        setupTableview()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMovie" {
            let movieController = segue.destination as! MovieController
            delegate.movieController = movieController
        }
    }
    
    // MARK: - Helper Methods
    
    /**
     
     */
    func setupTableview() {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
}
