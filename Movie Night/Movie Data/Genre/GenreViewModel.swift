//
//  GenreViewModel.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 15.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation

struct GenreViewModel {
    var id: Int
    var name: String
    var isSelected: Bool = false
    
    init(genre: MovieGenre) {
        self.id = genre.id
        self.name = genre.name
    }
}
