//
//  MovieDatasource.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 17.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import UIKit

class MovieDatasource: NSObject, UITableViewDataSource {
    
    private var movies: [Movie]
    let tableView: UITableView
    let pendingOperations = PendingOperations()
    
    init(movies: [Movie], tableView: UITableView) {
        self.movies = movies
        self.tableView = tableView
    }
    
    // MARK: - Datasource methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.reuseIdentifier, for: indexPath) as! MovieCell
        
        let movie = movies[indexPath.row]
        let viewModel = MoviewViewModel(movie: movie)
        
        cell.configure(from: viewModel)
        
        if movie.downloaded == .placeholder {
            downloadPosterImage(movie, atIndexPath: indexPath)
        }
        
        return cell
    }
    
    // MARK: - Helper Methods
    
    func update(with movies: [Movie]) {
        self.movies = movies
    }
    
    func downloadPosterImage(_ movie: Movie, atIndexPath indexPath: IndexPath) {
        
        if let _ = pendingOperations.downloadsInProgress[indexPath] {
            return
        }
        
        let downloader = PosterImageDownloader(movie: movie)
        
        downloader.completionBlock = {
            
            if downloader.isCancelled {
                return
            }
            
            DispatchQueue.main.async {
                self.pendingOperations.downloadsInProgress.removeValue(forKey: indexPath)
                self.tableView.reloadRows(at: [indexPath], with: .none)
            }
        }
        
        pendingOperations.downloadsInProgress[indexPath] = downloader
        pendingOperations.downloadQueue.addOperation(downloader)
        
    }
    
}
