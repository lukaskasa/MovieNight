//
//  ResultController.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 16.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import UIKit

class ResultController: UITableViewController {
    
    // MARK: - Properties
    var delegate: MovieDelegate?
    var movies: [Movie]? {
        didSet {
            delegate = MovieDelegate(data: movies!)
            dataSource.update(with: movies!)
            setupTableview()
        }
    }
    
    lazy var dataSource: MovieDatasource = {
        return MovieDatasource(movies: [], tableView: self.tableView)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMovie" {
            let movieController = segue.destination as! MovieController
            delegate!.movieController = movieController
        }
    }
    
    // MARK: - Helper Methods
    
    func setupTableview() {
        tableView.delegate = delegate
        dataSource.resultController = self
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
}
