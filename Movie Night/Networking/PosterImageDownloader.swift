//
//  PosterImageDownloader.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 19.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation
import UIKit

class PosterImageDownloader: Operation {
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
        super.init()
    }
    
    override var isAsynchronous: Bool {
        return true
    }
    
    override func main() {
        
        if self.isCancelled {
            return
        }
        
        guard let url = URL(string: "/t/p/w300\(movie.posterPath)", relativeTo: ImageDownload.baseURL!) else {
            return
        }
        
        do {
            let imageData = try Data(contentsOf: url)
            
            if self.isCancelled {
                return
            }
            
            if imageData.count > 0 {
                movie.posterImage = UIImage(data: imageData)
                movie.downloaded = .downloaded
            } else {
                movie.downloaded = .failed
            }
            
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    
}
