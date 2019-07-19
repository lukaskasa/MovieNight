//
//  ProfileImageDownloader.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 18.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation
import UIKit

class ProfileImageDownloader: Operation {
    
    var actor: Actor
    
    init(actor: Actor) {
        self.actor = actor
        super.init()
    }
    
    override var isAsynchronous: Bool {
        return true
    }
    
    override func main() {
        
        if self.isCancelled {
            return
        }
        
        guard let url = URL(string: "/t/p/w200\(actor.profilePath)", relativeTo: ImageDownload.baseURL!) else {
            return
        }
        
        do {
            let imageData = try Data(contentsOf: url)
            
            if self.isCancelled {
                return
            }
            
            if imageData.count > 0 {
                actor.profileImage = UIImage(data: imageData)
                actor.downloaded = .downloaded
            } else {
                actor.downloaded = .failed
            }
            
        } catch let error {
            print(error.localizedDescription)
        }

    }
    
}
