//
//  MovieGenre.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 12.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation

class MovieGenre: MovieData, Decodable {
    
    let id: Int
    let name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
}
