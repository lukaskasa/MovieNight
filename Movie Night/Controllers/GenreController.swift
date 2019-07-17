//
//  GenreController.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 13.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import UIKit

class GenreController: UITableViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var nextBarButton: UIBarButtonItem!
    @IBOutlet weak var stateBarButtonItem: UIBarButtonItem!
    
    // MARK: - Properties
    let dataSource = GenreDatasource(data: Stub.genres)
    let delegate = GenreDelegate(data: Stub.genres)
    
    var mainController: MainViewController?
    
    var firstWatcher: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup
        disableNavigation()
        setupTableview()
        
        
        stateBarButtonItem.width = view.frame.size.width
        self.navigationController?.setToolbarHidden(false, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setToolbarHidden(false, animated: false)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let actorController = segue.destination as! ActorController
        actorController.pickedGenres = delegate.selectedGenres
        actorController.firstWatcher = firstWatcher
    }
    
    
    // MARK: - Helper Methods
    
    /**
     
     */
    func setupTableview() {
        tableView.allowsMultipleSelection = true
        tableView.delegate = delegate
        delegate.genreController = self
        tableView.dataSource = dataSource
    }
    
    func enableNavigation() {
        nextBarButton.isEnabled = true
    }
    
    func disableNavigation() {
        nextBarButton.isEnabled = false
    }
    
}
