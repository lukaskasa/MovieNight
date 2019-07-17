//
//  MovieMatcher.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 13.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation

class MovieMatcher {
    
    static func getCommonGenres() -> [MovieGenre] {
        var commonGenres = [MovieGenre]()

        for genre in WatcherOne.pickedGenres {
            if WatcherTwo.pickedGenres.contains(where: { $0.id == genre.id }) {
                commonGenres.append(genre)
            }
        }

        return commonGenres
    }
    
    static func getCommonActors() -> [Actor] {
        var commonActors = [Actor]()
        
        for actor in WatcherOne.pickedActors {
            if WatcherTwo.pickedActors.contains(where: { $0.id == actor.id }) {
                commonActors.append(actor)
            }
        }
        
        return commonActors
    }
    
    static func getCommonDecades() -> [Decade] {
        var commonDecades = [Decade]()
        
        for decade in WatcherOne.pickedDecades {
            if WatcherTwo.pickedDecades.contains(where: { $0.startDate == decade.startDate }) {
                commonDecades.append(decade)
            }
        }
        
        return commonDecades
    }
    
}
