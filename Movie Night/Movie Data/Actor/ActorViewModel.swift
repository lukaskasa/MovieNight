//
//  ActorViewModel.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 15.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation

class ActorViewModel {
    /// Properties
    var id: Int
    var name: String
    var isSelected: Bool = false
    
    init(actor: Actor) {
        self.id = actor.id
        self.name = actor.name
    }
    
}
