//
//  APIClient.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 17.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation

protocol APIClient {
    var session: URLSession { get }
}

extension APIClient {
    
    typealias DataTaskCompletionHandler = (Data?, APIError?) -> Void
    
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
