//
//  GenreCell.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 15.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import UIKit

enum Checkmark {
    case unchecked
    case checked
    
    var image: UIImage {
        switch self {
        case .checked:
            return UIImage(named: "verified")!
        case .unchecked:
            return UIImage(named: "unverified")!
        }
    }
}

class GenreCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var checkMark: UIImageView!
    @IBOutlet weak var genreLabel: UILabel!
    
    // MARK: - Properties
    static let reuseIdentifier = "GenreCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        self.checkMark.image = selected ? Checkmark.checked.image : Checkmark.unchecked.image
    }

}
