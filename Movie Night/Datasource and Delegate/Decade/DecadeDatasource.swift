//
//  DecadeDatasource.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 16.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import UIKit

class DecadeDatasource: NSObject, UITableViewDataSource {
    
    private var data: [Decade]
    
    init(data: [Decade]) {
        self.data = data
    }
    
    // MARK: - Datasource Methods
    /// Apple Documentation: https://developer.apple.com/documentation/uikit/uitableviewdatasource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DecadeCell.reuseIdentifier, for: indexPath) as! DecadeCell
        
        let decade = data[indexPath.row]
        let viewModel = DecadeViewModel(decade: decade)
        cell.decadeLabel.text = viewModel.name
        
        return cell
    }
    
}
