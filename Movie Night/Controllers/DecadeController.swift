//
//  DecadeController.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 16.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import UIKit

class DecadeController: UITableViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var finishBarButton: UIBarButtonItem!
    @IBOutlet weak var stateBarButtonItem: UIBarButtonItem!
    
    
    // MARK - Properties
    let delegate = DecadeDelegate(data: Decade.allCases)
    let dataSource = DecadeDatasource(data: Decade.allCases)
    var pickedGenres = [MovieGenre]()
    var pickedActors = [Actor]()
    var firstWatcher: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup
        disableNavigation()
        setupTableview()
        stateBarButtonItem.width = view.frame.size.width
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if firstWatcher {
            WatcherOne.pickedGenres = pickedGenres
            WatcherOne.pickedActors = pickedActors
            WatcherOne.pickedDecades = delegate.selectedDecades
        } else {
            WatcherTwo.pickedGenres = pickedGenres
            WatcherTwo.pickedActors = pickedActors
            WatcherTwo.pickedDecades = delegate.selectedDecades
        }
    }
    
    
    // MARK: - Helper Methods

    func setupTableview() {
        tableView.allowsMultipleSelection = true
        tableView.delegate = delegate
        delegate.decadeController = self
        tableView.dataSource = dataSource
    }
    
    func enableNavigation() {
        finishBarButton.isEnabled = true
    }
    
    func disableNavigation() {
        finishBarButton.isEnabled = false
    }

}
