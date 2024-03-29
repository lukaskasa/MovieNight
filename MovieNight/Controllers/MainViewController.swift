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
    let client = MovieDBAPIClient()
    let matcher = MovieMatcher()
    var genreController: GenreController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup
        setupNavigation()
        setButtonState()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupNavigation()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "selectForFirstWatcher" || segue.identifier == "selectForSecondWatcher" {
            let genreController = segue.destination as! GenreController
            
            client.getGenres { genres, error in
                
                DispatchQueue.main.async {
                    if let genres = genres {
                        genreController.genres = genres["genres"]
                    }
                    
                    if error != nil {
                        genreController.error = true
                    }
                    
                    switch segue.identifier {
                    case "selectForFirstWatcher": genreController.firstWatcher = true
                    case "selectForSecondWatcher": genreController.firstWatcher = false
                    default: return
                    }
                }
                    
            }
        } else if segue.identifier == "showResults" {
            let resultsController = segue.destination as! ResultController
            let genres = MovieMatcher.getCommonGenres().map({ "\($0.id)" }).joined(separator: "|")
            let cast = MovieMatcher.getCommonActors().map({ "\($0.id)" }).joined(separator: "|")
            let startDate = matcher.getStartDate()
            let endDate = matcher.getEndDate()
            
            client.getMovies(genres: genres, cast: cast, startDate: startDate, endDate: endDate) { movies, error in
                
                DispatchQueue.main.async {
                    if let movies = movies {
                        resultsController.movies = movies.results
                    }
                    
                    if error != nil {
                        self.showAlertWith(title: "Error", message: error!.localizedDescription)
                    }
                }

            }
        }

    }
    
    // MARK: - Actions
    
    @IBAction func clearSelections(_ sender: Any) {
        WatcherOne.pickedGenres.removeAll()
        WatcherOne.pickedActors.removeAll()
        WatcherOne.pickedDecades.removeAll()
        WatcherTwo.pickedGenres.removeAll()
        WatcherTwo.pickedActors.removeAll()
        WatcherTwo.pickedDecades.removeAll()
        self.firstWatcherButton.setBackgroundImage(CompletedButton.notcompleted.image, for: .normal)
        self.secondWatcherButton.setBackgroundImage(CompletedButton.notcompleted.image, for: .normal)
        self.resultsButton.isEnabled = false
        self.resultsButton.isHidden = true
        clearBarButton.isEnabled = false
    }
    
    
    // MARK: - Helper Methods
    
    func setupNavigation() {
        genreController?.mainController = self
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

