//
//  Watcher.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 13.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation

class Watcher {
    
    let pickedGenres: [MovieGenre]
    let pickedActors: [Actor]
    let pickedDecades: [Decade]
    
    init(pickedGenres: [MovieGenre], pickedActors: [Actor], pickedDecades: [Decade]) {
        self.pickedGenres = pickedGenres
        self.pickedActors = pickedActors
        self.pickedDecades = pickedDecades
    }
    
}
