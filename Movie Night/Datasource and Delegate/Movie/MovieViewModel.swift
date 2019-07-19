//
//  MovieViewModel.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 16.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation
import UIKit

struct MoviewViewModel {
    
    var title: String
    var description: String
    var year: String
    var posterImage: UIImage
    
    init(movie: Movie) {
        self.title = movie.title
        self.description = movie.overview
        self.year = movie.year!
        self.posterImage = movie.downloaded == .downloaded ? movie.image! : UIImage(imageLiteralResourceName: "video-player")
    }
    
}
