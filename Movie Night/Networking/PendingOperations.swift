//
//  PendingOperations.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 18.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation

class PendingOperations {
    var downloadsInProgress = [IndexPath: Operation]()
    let downloadQueue = OperationQueue()
}
