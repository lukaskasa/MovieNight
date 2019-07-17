//
//  MovieController.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 16.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import UIKit

class MovieController: UIViewController {
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieReleaseYearLabel: UILabel!
    @IBOutlet weak var moviePosterImage: UIImageView!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    
    var movie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup
        setupMovieData()
    }
    
    func setupMovieData() {
        movieTitleLabel.text = movie?.title
        movieReleaseYearLabel.text = movie?.releaseDate
        movieDescriptionLabel.text = movie?.overview
    }
    
}
