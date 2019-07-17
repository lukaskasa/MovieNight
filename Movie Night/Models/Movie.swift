//
//  Movie.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 13.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation

class Movie {
    
    let title: String
    let posterPath: String
    let overview: String
    let releaseDate: String
    
    init(title: String, posterPath: String, overview: String, releaseDate: String) {
        self.title = title
        self.posterPath = posterPath
        self.overview = overview
        self.releaseDate = releaseDate
    }
    
}
