//
//  MovieDatasource.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 17.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import UIKit

class MovieDatasource: NSObject, UITableViewDataSource {
    
    private var data: [Movie]
    
    init(data: [Movie]) {
        self.data = data
    }
    
    // MARK: - Datasource methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.reuseIdentifier, for: indexPath) as! MovieCell
        
        let movie = data[indexPath.row]
        let viewModel = MoviewViewModel(movie: movie)
        cell.movieTitleLabel.text = viewModel.title
        cell.movieReleaseYearLabel.text = viewModel.year
        
        return cell
    }
}
