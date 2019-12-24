//
//  APIClient.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 17.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation

/// APIClient Protocol
protocol APIClient {
    var session: URLSession { get }
    var jsonDecoder: JSONDecoder { get }
}

/// Default APIClient protocol implementation
extension APIClient {
    /// Typealias for the completionHandler
    typealias DataTaskCompletionHandler = (Data?, APIError?) -> Void
    
    /**
     Data task
     
     - Parameters:
        - request: The request passed in
        - completion: Completion Handler to be executed after the task is completed.
     
     - Returns: A session task to retrieve data using the given request
     */
    func dataTask(with request: URLRequest, completionHandler completion: @escaping DataTaskCompletionHandler) -> URLSessionDataTask {
        
        let task = session.dataTask(with: request) { data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .requestFailed)
                return
            }
            
            if httpResponse.statusCode == 200 {
                
                if let data = data {
                    completion(data, nil)
                }
                
            } else {
                completion(nil, .responseUnsuccessful)
            }
            
        }
        
        return task
    }
    
}
