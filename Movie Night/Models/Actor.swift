//
//  Actor.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 12.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation

class Actor: MovieData {
    
    let id: Int
    let profilePath: String
    let name: String
    
    init(id: Int, profilePath: String, name: String) {
        self.id = id
        self.profilePath = profilePath
        self.name = name
    }
    
}
