//
//  Endpoint.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 17.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation
/// Type to provide URLRequests for defined API Requests
protocol Endpoint {
    var base: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
}

extension Endpoint {
    /// API Key represent by a query parameter
    var apiKey: URLQueryItem {
        return URLQueryItem(name: "api_key", value: Secrets.apiKey)
    }
    
    /// URLComponents using to create the URL
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        components.queryItems = queryItems
        components.queryItems?.append(apiKey)
        return components
    }
    
    /// The actual request used to obtain the data from the API
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }

}

/// Enum representation of the different endpoints used from this API
enum MovieDB {
    case genres
    case actors
    case discoverMovie(cast: String, genres: String, startDate: String, endDate: String)
}

/// Extension for MovieDB which implements the Endpoint protocol
extension MovieDB: Endpoint {
    
    var base: String {
        return "https://api.themoviedb.org"
    }
    
    var path: String {
        switch self {
        case .genres:
            return "/3/genre/movie/list"
        case .actors:
            return "/3/person/popular"
        case .discoverMovie:
            return "/3/discover/movie"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .genres:
            return [
                URLQueryItem(name: "language", value: "en-US")
            ]
        case .actors:
            return [
                URLQueryItem(name: "language", value: "en-US")
            ]
        case .discoverMovie(cast: let cast, genres: let genres, startDate: let startDate, endDate: let endDate):
            return [
                URLQueryItem(name: "with_cast", value: cast),
                URLQueryItem(name: "with_genres", value: genres),
                URLQueryItem(name: "primary_release_date.gte", value: startDate),
                URLQueryItem(name: "primary_release_date.lte", value: endDate)
            ]
        }

    }
}
