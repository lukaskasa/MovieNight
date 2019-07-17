//
//  MovieViewModel.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 16.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation

class MoviewViewModel {
    
    var title: String
    var description: String
    var year: String
    
    init(movie: Movie) {
        self.title = movie.title
        self.description = movie.overview
        self.year = movie.releaseDate
    }
    
}
