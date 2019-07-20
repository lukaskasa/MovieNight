//
//  PendingOperations.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 18.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation
/// Used to regulate the queue and tasks to be executed
class PendingOperations {
    var downloadsInProgress = [IndexPath: Operation]()
    let downloadQueue = OperationQueue()
}
