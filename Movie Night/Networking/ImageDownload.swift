//
//  ImageDownload.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 19.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation

/// ImageDownload struct
struct ImageDownload {
    
    /// Example: https://image.tmdb.org/t/p/w200/wwemzKWzjKYJFfCeiB57q3r4Bcm.png
    
    static let baseURL = URL(string: "https://image.tmdb.org")
    
    /// Enum to represent State of image download
    enum State {
        case downloaded
        case placeholder
        case failed
    }
    
}
