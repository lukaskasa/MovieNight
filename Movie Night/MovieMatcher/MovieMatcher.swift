//
//  MovieMatcher.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 13.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation

class MovieMatcher {
    
    static func getCommonGenres() -> [MovieGenre] {
        var commonGenres = [MovieGenre]()

        for genre in WatcherOne.pickedGenres {
            if WatcherTwo.pickedGenres.contains(where: { $0.id == genre.id }) {
                commonGenres.append(genre)
            }
        }

        return commonGenres
    }
    
}
