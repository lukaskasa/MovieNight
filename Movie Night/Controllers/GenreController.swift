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
    let client = MovieDBAPIClient()
    var dataSource: GenreDatasource?
    var delegate: GenreDelegate?
    
    var mainController: MainViewController?
    var firstWatcher: Bool = false
    
    var error: Bool? {
        didSet {
            checkForConnection(error!)
        }
    }
    
    var genres: [MovieGenre]? {
        didSet {
            dataSource = GenreDatasource(genres: genres!)
            delegate = GenreDelegate(allGenres: genres!)
            setupTableview()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup
        disableNavigation()
        stateBarButtonItem.width = view.frame.size.width
        self.navigationController?.setToolbarHidden(false, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
        self.navigationController?.setToolbarHidden(false, animated: false)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let actorController = segue.destination as! ActorController
        
        client.getActors { actors, error in
            
            if let actors = actors {
                actorController.actors = actors.results
            }
            
            if error != nil {
                print(error!.localizedDescription)
            }
            
        }
        
        actorController.pickedGenres = delegate!.selectedGenres
        actorController.firstWatcher = firstWatcher
    }
    
    
    // MARK: - Helper Methods
    
    func setupTableview() {
        tableView.allowsMultipleSelection = true
        tableView.delegate = delegate
        delegate!.genreController = self
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
    
    func enableNavigation() {
        nextBarButton.isEnabled = true
    }
    
    func disableNavigation() {
        nextBarButton.isEnabled = false
    }
    
    func checkForConnection(_ error: Bool) {
        if error {
            performActionOnAlert(title: "No connection", message: "Internet connection could not be established! Please try again.")
        }
    }
    
    /**
     Sets up and shows an Alert to iniate a new request
     
     - Parameters:
     - title: The title of the alert
     - message: The message of the alert
     
     - Returns: Void
     */
    func performActionOnAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let tryAgainAction = UIAlertAction(title: "Try again", style: .default, handler: { _ in
            self.client.getGenres { genres, error in
                if let genres = genres {
                    self.genres = genres["genres"]
                }
                
                if error != nil {
                    self.performActionOnAlert(title: "No connection", message: "Internet connection could not be established! Please try again.")
                }
            }
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(tryAgainAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: false, completion: nil)
    }
    
}
