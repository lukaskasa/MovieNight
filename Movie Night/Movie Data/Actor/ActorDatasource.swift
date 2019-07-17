//
//  ActorDatasource.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 15.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import UIKit

class ActorDatasource: NSObject, UITableViewDataSource {
    
    private var data: [Actor]
    
    init(data: [Actor]) {
        self.data = data
    }
    
    // MARK: - Datasource Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ActorCell.reuseIdentifier, for: indexPath) as! ActorCell
        
        let actor = data[indexPath.row]
        let viewModel = ActorViewModel(actor: actor)
        cell.actorName.text = viewModel.name

        return cell
    }
    
}
