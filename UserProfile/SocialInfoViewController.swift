//
//  SocialInfoViewController.swift
//  UserProfile
//
//  Created by Milos on 4/18/16.
//  Copyright © 2016 SuperCogs. All rights reserved.
//

import UIKit

class SocialInfoViewController: UIViewController {
    
    var infoText: String?
    @IBOutlet weak var infoLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        infoLabel.text = infoText
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
