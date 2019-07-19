//
//  ActorViewModel.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 15.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation
import UIKit

struct ActorViewModel {
    /// Properties
    var id: Int
    var profilePath: String
    var name: String
    var isSelected: Bool = false
    var profileImage: UIImage
    
    init(actor: Actor) {
        self.id = actor.id
        self.profilePath = actor.imagePath
        self.profileImage = actor.downloaded == .downloaded ? actor.image! : UIImage(imageLiteralResourceName: "boy")
        self.name = actor.name
    }
}
