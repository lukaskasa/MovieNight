//
//  Imageable.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 19.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation
import UIKit

/// Protocol used for objects to provided image properties used to download images and display these on the UI
protocol Imageable {
    var imagePath: String { get }
    var image: UIImage? { get set }
    var downloaded: ImageDownload.State { get set }
}
