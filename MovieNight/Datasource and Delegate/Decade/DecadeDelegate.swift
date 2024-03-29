//
//  DecadeDelegate.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 16.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import UIKit

class DecadeDelegate: NSObject, UITableViewDelegate {
    
    // MARK: - Properties
    
    private let cellHeight: CGFloat = 60.0
    private let amountOfDecadesToBeSelected: Int = 3
    var decadeController: DecadeController?
    var decades = [DecadeViewModel]()
    
    var selectedDecades: [Decade] {
        var filteredDecades = [Decade]()
        let selected = decades.filter { return $0.isSelected == true }
        let names = selected.map { $0.name }
        for name in names {
            filteredDecades.append(Decade.allCases.filter { return $0.rawValue == name }.first!)
        }
        return filteredDecades
    }
    
    init(data: [Decade]) {
        decades = data.map { DecadeViewModel(decade: $0) }
    }
    
    // MARK: - Delegate Methods
    /// Apple Documentation https://developer.apple.com/documentation/uikit/uitableviewdelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        decades[indexPath.row].isSelected = true
        toggleNavigation()
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        decades[indexPath.row].isSelected = false
        toggleNavigation()
    }
    
    // MARK: - Helper Methods
    
    /**
     Toggle the status of selections and enable/disable next button
     */
    func toggleNavigation() {
        if selectedDecades.count == amountOfDecadesToBeSelected {
            self.decadeController?.enableNavigation()
            self.decadeController?.stateBarButtonItem.title = "\(selectedDecades.count) of \(amountOfDecadesToBeSelected) selected"
        } else {
            self.decadeController?.disableNavigation()
            self.decadeController?.stateBarButtonItem.title = "\(selectedDecades.count) of \(amountOfDecadesToBeSelected) selected"
        }
    }
    
}
