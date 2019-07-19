//
//  ActorCell.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 15.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import UIKit

class ActorCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var actorImage: UIImageView!
    @IBOutlet weak var actorName: UILabel!
    
    // MARK: Properties
    private let selectColor = UIColor(red: 125/255, green: 47/255, blue: 47/255, alpha: 0.5)
    static let reuseIdentifier = "ActorCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        self.backgroundColor = selected ? selectColor : UIColor.white
    }

    func configure(from viewModel: ActorViewModel) {
        actorName.text = viewModel.name
        actorImage.image = viewModel.profileImage
    }
}
