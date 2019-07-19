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

class Actor: Imageable, Decodable {
    
    let id: Int
    let imagePath: String
    let name: String
    
    var image: UIImage?
    var downloaded: ImageDownload.State = .placeholder
    
    init(id: Int, imagePath: String, name: String) {
        self.id = id
        self.imagePath = imagePath
        self.name = name
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case imagePath = "profile_path"
        case name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        imagePath = try container.decode(String.self, forKey: .imagePath)
    }

}
