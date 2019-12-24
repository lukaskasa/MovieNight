//
//  Watcher.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 13.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation
/// WatcherOne and WatcherTwo singletons used to store selections
protocol Watcher {
    static var pickedGenres: [MovieGenre] { get set }
    static var pickedActors: [Actor] { get set }
    static var pickedDecades: [Decade] { get set }
}

struct WatcherOne: Watcher {
    static var pickedGenres = [MovieGenre]()
    static var pickedActors = [Actor]()
    static var pickedDecades = [Decade]()
}

struct WatcherTwo: Watcher {
    static var pickedGenres = [MovieGenre]()
    static var pickedActors = [Actor]()
    static var pickedDecades = [Decade]()
}
