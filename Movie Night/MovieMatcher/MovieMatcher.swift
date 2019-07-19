//
//  MovieMatcher.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 13.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation

/// Class to get common genres, actors and time periods
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
    
    public func getCommonDecades() -> [Decade] {
        var commonDecades = [Decade]()
        
        for decade in WatcherOne.pickedDecades {
            if WatcherTwo.pickedDecades.contains(where: { $0.startDate == decade.startDate }) {
                commonDecades.append(decade)
            }
        }
        
        return commonDecades
    }
    
    
    func getStartDate() -> String {
        var startDate = Decade.twentyTens.startDate
        let commonDecades = self.getCommonDecades()
        
        for decade in commonDecades {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-DD"
            let date = formatter.date(from: decade.startDate)!
            if date < formatter.date(from: startDate)! {
                startDate = decade.startDate
            }
        }
        
        return startDate
    }
    
    func getEndDate() -> String {
        var endDate = Decade.nineteenTwenties.endDate
        let commonDecades = self.getCommonDecades()
        
        for decade in commonDecades {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-DD"
            let date = formatter.date(from: decade.endDate)!
            if date > formatter.date(from: endDate)! {
                endDate = decade.endDate
            }
        }
        
        return endDate
    }
    
    
}
