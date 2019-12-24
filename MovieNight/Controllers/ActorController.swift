//
//  ActorController.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 14.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import UIKit

class ActorController: UITableViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var nextBarButton: UIBarButtonItem!
    @IBOutlet weak var stateBarButtonItem: UIBarButtonItem!
    
    // MARK: - Properties
    var delegate: ActorDelegate?
    var mainController: MainViewController?
    var pickedGenres = [MovieGenre]()
    var firstWatcher: Bool = false
    
    var actors: [Actor]? {
        didSet {
            dataSource.update(with: actors!)
            delegate = ActorDelegate(data: actors!)
            setupTableview()
        }
    }
    
    lazy var dataSource: ActorDatasource = {
        return ActorDatasource(actors: [], tableView: self.tableView)
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup
        disableNavigation()
        stateBarButtonItem.width = view.frame.size.width
    }
    
    
    // MARK: - Helper Methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let decadeController = segue.destination as! DecadeController
        decadeController.pickedGenres = pickedGenres
        decadeController.pickedActors = delegate!.selectedActors
        decadeController.firstWatcher = firstWatcher
    }
    
    // MARK: - Helper Methods

    func setupTableview() {
        tableView.allowsMultipleSelection = true
        tableView.delegate = delegate
        delegate!.actorController = self
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
    
    func enableNavigation() {
        nextBarButton.isEnabled = true
    }
    
    func disableNavigation() {
        nextBarButton.isEnabled = false
    }
    
}

