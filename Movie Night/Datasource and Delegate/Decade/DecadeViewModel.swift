//
//  DecadeViewModel.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 16.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation

class DecadeViewModel {
    /// Properties
    var name: String
    var isSelected: Bool = false
    
    /// Initializer
    init(decade: Decade) {
        self.name = decade.name
    }
    
}
