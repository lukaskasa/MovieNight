//
//  Imageable.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 19.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation
import UIKit

protocol Imageable {
    var imagePath: String { get }
    var image: UIImage? { get set }
    var downloaded: ImageDownload.State { get set }
}
