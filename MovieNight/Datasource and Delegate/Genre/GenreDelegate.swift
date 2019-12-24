//
//  GenreDelegate.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 15.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation
import UIKit

class GenreDelegate: NSObject, UITableViewDelegate {
    
    /// Properties
    private let cellHeight: CGFloat = 60.0
    private let amountOfGenresToBeSelected: Int = 5
    var genreController: GenreController?
    var genres = [GenreViewModel]()
    
    var selectedGenres: [MovieGenre] {
        let selected = genres.filter { return $0.isSelected }
        return selected.map({ return MovieGenre(id: $0.id, name: $0.name) })
    }
    
    init(allGenres: [MovieGenre]) {
        genres = allGenres.map{GenreViewModel(genre: $0)}
    }

    // MARK: - Delegate Methods
    /// Apple Documentation https://developer.apple.com/documentation/uikit/uitableviewdelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        genres[indexPath.row].isSelected = true
        toggleNavigation()
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        genres[indexPath.row].isSelected = false
        toggleNavigation()
    }
    
    // MARK: - Helper Methods
    
    /**
     Toggle the status of selections and enable/disable next button 
     */
    func toggleNavigation() {
        if selectedGenres.count == amountOfGenresToBeSelected {
            self.genreController?.enableNavigation()
            self.genreController?.stateBarButtonItem.title = "\(selectedGenres.count) of \(amountOfGenresToBeSelected) selected"
        } else {
            self.genreController?.disableNavigation()
            self.genreController?.stateBarButtonItem.title = "\(selectedGenres.count) of \(amountOfGenresToBeSelected) selected"
        }
    }
    
}
