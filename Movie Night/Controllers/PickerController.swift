//
//  PickerController.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 13.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import UIKit

class PickerController: UITableViewController {
    
    
    @IBOutlet weak var stateBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stateBarButton.title = "0 of 5 selected"
        stateBarButton.width = self.view.frame.width
        
    }

}
