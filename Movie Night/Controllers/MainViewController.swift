//
//  MainViewController.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 07.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import UIKit

enum CompletedButton {
    case notcompleted
    case completed
    
    var image: UIImage {
        switch self {
        case .notcompleted:
            return UIImage(named: "bubble-empty")!
        case .completed:
            return UIImage(named: "bubble-selected")!
        }
    }
}

class MainViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var firstWatcherButton: UIButton!
    @IBOutlet weak var secondWatcherButton: UIButton!
    @IBOutlet weak var clearBarButton: UIBarButtonItem!
    @IBOutlet weak var resultsButton: UIButton!
    
    // MARK: - Properties
//    var firstWatcher: Watcher?
//    var secondWatcher: Watcher?
    var genreController: GenreController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("First Watcher:")
        dump(WatcherOne.pickedDecades)
        print("Second Watcher:")
        dump(WatcherTwo.pickedDecades)
        // Set up
        genreController?.mainController = self
        // UI Set up
        setupNavigation()
        setButtonState()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupNavigation()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectForFirstWatcher" {
            let genreController = segue.destination as! GenreController
            genreController.firstWatcher = true
        } else if segue.identifier == "selectForSecondWatcher" {
            let genreController = segue.destination as! GenreController
            genreController.firstWatcher = false
        } else if segue.identifier == "showResults" {
            
        }
    }
    
    // MARK: - Actions
    
    @IBAction func clearSelections(_ sender: Any) {
        WatcherOne.pickedGenres = []
        WatcherOne.pickedActors = []
        WatcherOne.pickedDecades = []
        WatcherTwo.pickedGenres = []
        WatcherTwo.pickedActors = []
        WatcherTwo.pickedDecades = []
        self.firstWatcherButton.setBackgroundImage(CompletedButton.notcompleted.image, for: .normal)
        self.secondWatcherButton.setBackgroundImage(CompletedButton.notcompleted.image, for: .normal)
        clearBarButton.isEnabled = false
    }
    
    
    // MARK: - Helper Methods
    
    func setupNavigation() {
        self.navigationController?.setToolbarHidden(true, animated: false)
        self.navigationItem.setHidesBackButton(true, animated:true)
    }
    
    func setButtonState() {
        if WatcherOne.pickedDecades.count > 0 {
            self.firstWatcherButton.setBackgroundImage(CompletedButton.completed.image, for: .normal)
            clearBarButton.isEnabled = true
        }
        if WatcherTwo.pickedDecades.count > 0 {
            self.secondWatcherButton.setBackgroundImage(CompletedButton.completed.image, for: .normal)
            clearBarButton.isEnabled = true
        }
        
        if WatcherOne.pickedDecades.count > 0 && WatcherTwo.pickedDecades.count > 0 {
            resultsButton.isEnabled = true
            resultsButton.isHidden = false
        }
    }
    
    
}

