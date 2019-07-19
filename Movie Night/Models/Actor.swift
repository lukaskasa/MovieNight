//
//  Actor.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 12.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation
import UIKit

struct Actors: Decodable {
    let results: [Actor]
}

class Actor: MovieData, Decodable {
    
    let id: Int
    let profilePath: String
    let name: String
    
    var profileImage: UIImage?
    var downloaded: ImageDownload.State? = .placeholder
    
    init(id: Int, profilePath: String, name: String) {
        self.id = id
        self.profilePath = profilePath
        self.name = name
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case profilePath
        case name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        profilePath = try container.decode(String.self, forKey: .profilePath)
    }

}
