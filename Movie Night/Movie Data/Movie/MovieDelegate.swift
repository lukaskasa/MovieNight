//
//  MovieDelegate.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 17.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import UIKit

class MovieDelegate: NSObject, UITableViewDelegate {
    
    // MARK: - Properties
    
    private let cellHeight: CGFloat = 80.0
    private var data: [Movie]
    
    var movieController: MovieController?
    
    init(data: [Movie]) {
        self.data = data
    }
    
    // MARK: - Delegate Methods
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let indexPath = tableView.indexPathForSelectedRow!
        //let selectedCell = tableView.cellForRow(at: indexPath)
        
        movieController?.movie = data[indexPath.row]
        //navigationController?.pushViewController(movieController, animated: true)
    }
    
}
