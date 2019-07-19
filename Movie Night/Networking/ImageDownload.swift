//
//  ImageDownload.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 19.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation

struct ImageDownload {
    
    static let baseURL = URL(string: "https://image.tmdb.org")
    
    enum State {
        case downloaded
        case placeholder
        case failed
    }
    
}
