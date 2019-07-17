//
//  DecadeCell.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 16.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import UIKit

class DecadeCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var checkMark: UIImageView!
    @IBOutlet weak var decadeLabel: UILabel!
    
    // MARK: - Properties
    
    static let reuseIdentifier = "DecadeCell"
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        self.checkMark.image = selected ? Checkmark.checked.image : Checkmark.unchecked.image
    }

}
