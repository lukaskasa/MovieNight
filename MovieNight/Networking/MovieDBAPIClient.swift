//
//  MovieDBAPIClient.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 17.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation

/// API Client for the Movie DB which Implements the APIClient protocol
/// https://developers.themoviedb.org/3
class MovieDBAPIClient: APIClient {
    
    /// Properties
    let jsonDecoder = JSONDecoder()
    var session: URLSession
    
    /**
     Initializes a client object with the given URL Session Configuration
     
     - Parameters:
        - configuration: Session configuration
     
     - Returns: A client used perform API requests
     */
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    /**
     Initializes a client object with the .default configuration
     
     - Returns: A client used perform API requests
     */
    convenience init() {
        self.init(configuration: .default)
    }
    
    /// Typealiases for completion handlers
    typealias GenresCompletionHandler = ([String: [MovieGenre]]?, APIError?) -> Void
    typealias ActorsCompletionHandler = (Actors?, APIError?) -> Void
    typealias MovieCompletionHandler = (Movies?, APIError?) -> Void
    
    /**
     Gets and parses all genres from the genres endpoint
     - Docs: https://developers.themoviedb.org/3/genres/get-movie-list
     
     - Parameters:
        - completion: Completion Handler once the request is completed. (Successfully or not)
     
     - Returns: Void
     */
    func getGenres(completionHandler completion: @escaping GenresCompletionHandler) {
        
        /// Endpoint
        let endpoint = MovieDB.genres
        
        performRequest(with: endpoint.request) { results, error in
            
            guard let results = results else {
                completion(nil, error)
                return
            }
            
            do {
                
                let genres = try self.jsonDecoder.decode([String: [MovieGenre]].self, from: results)
                completion(genres, nil)
                
            } catch {
                completion(nil, .jsonParsingFailure)
            }
            
        }
        
    }
    
    /**
     Gets the most popular people (actors) and parses from the get popular people endpoint
     - Docs: https://developers.themoviedb.org/3/people/get-popular-people
     
     - Parameters:
     - completion: Completion Handler once the request is completed. (Successfully or not)
     
     - Returns: Void
     */
    func getActors(completionHandler completion: @escaping ActorsCompletionHandler) {
        
        /// Endpoint
        let endpoint = MovieDB.actors
        
        performRequest(with: endpoint.request) { results, error in
            
            guard let results = results else {
                completion(nil, error)
                return
            }
            
            do {
                
                let actors = try self.jsonDecoder.decode(Actors.self, from: results)
                completion(actors, nil)
                
            } catch {
                completion(nil, .jsonParsingFailure)
            }
            
        }
        
    }
    
    /**
     Gets and parses movies from the discover enpoint with the provided parameter
     - Docs: https://developers.themoviedb.org/3/discover/movie-discover
     
     - Parameters:
        - genres: Genres array of ids e.g. 110|999|991...
        - cast: Actors array of ids e.g. 111|222|333...
        - startDate: Earliest date for a movie released e.g. 2010-07-01
        - endDate: Most recent date for a movie released e.g. 2019-07-01
        - completion: Completion Handler once the request is completed. (Successfully or not)
     
     - Returns: Void
     */
    func getMovies(genres: String, cast: String, startDate: String, endDate: String,  completionHandler completion: @escaping MovieCompletionHandler) {
        
        // Endpoint
        let endpoint = MovieDB.discoverMovie(cast: cast, genres: genres, startDate: startDate, endDate: endDate)
        
        performRequest(with: endpoint.request) { results, error in
            
            guard let results = results else {
                completion(nil, error)
                return
            }
            
            do {
                
                let movies = try self.jsonDecoder.decode(Movies.self, from: results)
                completion(movies, nil)
                
            } catch {
                completion(nil, .jsonParsingFailure)
            }
            
        }
        
    }
    
    /**
     Performs the data request for the given request
     
     - Parameters:
         - request: Request used for the task to be performed with
         - completion: Completion Handler once the request is completed. (Successfully or not)
     
     - Returns: Void
     */
    private func performRequest(with request: URLRequest, completion: @escaping (Data?, APIError?) -> Void) {
        
        let task = dataTask(with: request) { data, error in
            
            guard let data = data else {
                completion(nil, error)
                return
            }
            
            completion(data, nil)

        }
        
        task.resume()
    }
    
}
