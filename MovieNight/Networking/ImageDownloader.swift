//
//  ImageDownloader.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 18.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation
import UIKit

/// Image Downloader task
class ImageDownloader: Operation {
    
    /// Properties
    var entity: Imageable // -> Object that implements the Imageable protocol
    var quality: Int // -> Quality of image to be downloaded (width)
    
    /**
     Initializes a client object with the given URL Session Configuration
     
     - Parameters:
        - entity: Session configuration
        - quality: Quality (width of image in pixels) (100, 200, 300, 400, 500)
     
     - Returns: A download task for Images
     */
    init(entity: Imageable, quality: Int) {
        self.entity = entity
        self.quality = quality
        super.init()
    }
    
    override var isAsynchronous: Bool {
        return true
    }
    
    override func main() {
        
        if self.isCancelled {
            return
        }
        
        guard let url = URL(string: "/t/p/w\(quality)\(entity.imagePath)", relativeTo: ImageDownload.baseURL!) else {
            return
        }
        
        do {
            let imageData = try Data(contentsOf: url)
            
            if self.isCancelled {
                return
            }
            
            if imageData.count > 0 {
                entity.image = UIImage(data: imageData)
                entity.downloaded = .downloaded
            } else {
                entity.downloaded = .failed
            }
            
        } catch let error {
            print(error.localizedDescription)
        }

    }
    
}
