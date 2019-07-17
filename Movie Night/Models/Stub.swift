//
//  Stub.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 13.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation

struct Stub {
    
    static let action = MovieGenre(id: 28, name: "Action")
    static let adventure = MovieGenre(id: 12, name: "Adventure")
    static let animation = MovieGenre(id: 16, name: "Animation")
    static let comedy = MovieGenre(id: 35, name: "Comedy")
    static let drama = MovieGenre(id: 18, name: "Drama")
    
    static let genres = [action, adventure, animation, comedy, drama]
    
    static let bradPitt = Actor(id: 1, profilePath: "", name: "Brad Pitt")
    static let angelinaJolie = Actor(id: 2, profilePath: "", name: "Angelina Jolie")
    static let keanuReaves = Actor(id: 3, profilePath: "", name: "Keanu Reaves")
    static let jimCarrey = Actor(id: 4, profilePath: "", name: "Jim Carrey")
    static let kevinSpacey = Actor(id: 5, profilePath: "", name: "Kevin Spacey")
    
    static let actors = [bradPitt, angelinaJolie, keanuReaves, jimCarrey, kevinSpacey]
    
    static let decades: [Decade] = [.nineteenSeventies, .nineteenEighties, .nineteenNineties, .twoThousands, .twentyTens]
    
    static let jamesBond = Movie(title: "James Bond", posterPath: "", overview: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).", releaseDate: "2019-07-31")
    
    static let jamesBond2 = Movie(title: "James Bond 2", posterPath: "", overview: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).", releaseDate: "2019-07-31")
    
    static let jamesBond3 = Movie(title: "James Bond 3", posterPath: "", overview: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).", releaseDate: "2019-07-31")
    
    static let jamesBond4 = Movie(title: "James Bond 4", posterPath: "", overview: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).", releaseDate: "2019-07-31")

    static let jamesBond5 = Movie(title: "James Bond 5", posterPath: "", overview: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).", releaseDate: "2019-07-31")
    
    static let movies = [jamesBond, jamesBond2, jamesBond3, jamesBond4, jamesBond5]
}
