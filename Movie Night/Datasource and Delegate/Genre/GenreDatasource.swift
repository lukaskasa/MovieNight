//
//  GenreDatasource.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 14.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation
import UIKit

class GenreDatasource: NSObject, UITableViewDataSource {
    
    private var genres: [MovieGenre]
    
    init(genres: [MovieGenre]) {
        self.genres = genres
    }
    
    // MARK: - Data Source Methods
    /// Apple Documentation: https://developer.apple.com/documentation/uikit/uitableviewdatasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GenreCell.reuseIdentifier, for: indexPath) as! GenreCell
        
        let genre = genres[indexPath.row]
        let viewModel = GenreViewModel(genre: genre)
        cell.genreLabel.text = viewModel.name
        
        return cell
    }
    
}
