//
//  MovieCell.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 16.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieReleaseYearLabel: UILabel!
    
    // MARK: - Properties
    static let reuseIdentifier = "MovieCell"
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(from viewModel: MoviewViewModel) {
        posterImage.image = viewModel.posterImage
        movieTitleLabel.text = viewModel.title
        movieReleaseYearLabel.text = viewModel.year
    }

}
