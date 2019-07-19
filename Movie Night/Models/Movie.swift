//
//  Movie.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 13.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation
import UIKit

struct Movies: Decodable {
    let results: [Movie]
}

class Movie: Imageable, Decodable {
    
    let title: String
    let imagePath: String
    let overview: String
    var releaseDate: String

    var year: String?
    var image: UIImage?
    var downloaded: ImageDownload.State = .placeholder
    
    
    init(title: String, imagePath: String, overview: String, releaseDate: String) {
        self.title = title
        self.imagePath = imagePath
        self.overview = overview
        self.releaseDate = releaseDate
    }
    
    private enum CodingKeys: String, CodingKey {
        case title
        case imagePath = "poster_path"
        case overview
        case releaseDate = "release_date"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        imagePath = try container.decode(String.self, forKey: .imagePath)
        overview = try container.decode(String.self, forKey: .overview)
        releaseDate = try container.decode(String.self, forKey: .releaseDate)
        year = self.getYear(from: releaseDate)
    }
    
}

// MARK: - Helper Methods

extension Movie {
    
    private func getYear(from date: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-DD"
        let date = formatter.date(from: date)
        let calender = Calendar.current
        let year = calender.component(.year, from: date!)
        return year.description
    }
    
}
