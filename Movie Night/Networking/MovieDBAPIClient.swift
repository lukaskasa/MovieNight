//
//  MovieDBAPIClient.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 17.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation

/// Implements the APIClient protocol
class MovieDBAPIClient: APIClient {
    
    /// Properties
    let jsonDecoder = JSONDecoder()
    var session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    /// Typealiases
    
    typealias GenresCompletionHandler = ([String: [MovieGenre]]?, APIError?) -> Void
    typealias ActorsCompletionHandler = (Actors?, APIError?) -> Void
    typealias MovieCompletionHandler = (Movies?, APIError?) -> Void
    
    
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
    
    
    private func performRequest(with request: URLRequest, completion: @escaping (Data?, APIError?) -> Void) {
        
        let task = dataTask(with: request) { data, error in
            
            DispatchQueue.main.async {
                guard let data = data else {
                    completion(nil, error)
                    return
                }
                
                completion(data, nil)
            }
        }
        
        task.resume()
    }
    
}
