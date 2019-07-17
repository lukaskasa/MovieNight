//
//  ActorDelegate.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 15.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import UIKit

class ActorDelegate: NSObject, UITableViewDelegate {
    
    // MARK: - Properties
    private let cellHeight: CGFloat = 80.0
    private let amountOfActorsToBeSelected: Int = 5
    var actorController: ActorController?
    
    var actors = [ActorViewModel]()
    
    var selectedActors: [Actor] {
        let selected = actors.filter { $0.isSelected == true }
        return selected.map { return Actor(id: $0.id, profilePath: "", name: $0.name) }
    }
    
    init(data: [Actor]) {
        actors = data.map { ActorViewModel(actor: $0) }
    }
    
    // MARK: - Delegate Methods
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        actors[indexPath.row].isSelected = true
        toggleNavigation()
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        actors[indexPath.row].isSelected = false
        toggleNavigation()
    }
    
    // MARK: - Helper Methods
    
    func toggleNavigation() {
        if selectedActors.count == amountOfActorsToBeSelected {
            self.actorController?.enableNavigation()
            self.actorController?.stateBarButtonItem.title = "\(selectedActors.count) of \(amountOfActorsToBeSelected) selected"
        } else {
            self.actorController?.disableNavigation()
            self.actorController?.stateBarButtonItem.title = "\(selectedActors.count) of \(amountOfActorsToBeSelected) selected"
        }
    }
    
}
