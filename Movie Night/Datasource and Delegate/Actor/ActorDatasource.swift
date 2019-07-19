//
//  ActorDatasource.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 15.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import UIKit

class ActorDatasource: NSObject, UITableViewDataSource {
    
    private var actors: [Actor]
    let tableView: UITableView
    var pendingOperations = PendingOperations()
    
    init(actors: [Actor], tableView: UITableView) {
        self.actors = actors
        self.tableView = tableView
        super.init()
    }
    
    // MARK: - Datasource Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ActorCell.reuseIdentifier, for: indexPath) as! ActorCell
        
        let actor = actors[indexPath.row]
        let viewModel = ActorViewModel(actor: actor)
        
        cell.configure(from: viewModel)
        
        if actor.downloaded == .placeholder {
            downloadProfileImage(actor, atIndexPath: indexPath)
        }

        return cell
    }
    
    // MARK: - Helper Methods
    
    func update(with actors: [Actor]) {
        self.actors = actors
    }
    
    func downloadProfileImage(_ actor: Actor, atIndexPath indexPath: IndexPath) {
        
        if let _ = pendingOperations.downloadsInProgress[indexPath] {
            return
        }
        
        let downloader = ProfileImageDownloader(actor: actor)
        
        downloader.completionBlock = {
            
            if downloader.isCancelled {
                return
            }
            
            DispatchQueue.main.async {
                self.pendingOperations.downloadsInProgress.removeValue(forKey: indexPath)
                self.tableView.reloadRows(at: [indexPath], with: .none)
            }
            
        }
        
        pendingOperations.downloadsInProgress[indexPath] = downloader
        pendingOperations.downloadQueue.addOperation(downloader)
        
    }
    
}
