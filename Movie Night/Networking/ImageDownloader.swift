//
//  ImageDownloader.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 18.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation
import UIKit

class ImageDownloader: Operation {
    
    var entity: Imageable
    var quality: Int
    
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
