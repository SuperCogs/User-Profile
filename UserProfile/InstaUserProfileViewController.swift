//
//  InstaUserProfileViewController.swift
//  UserProfile
//
//  Created by Milos on 4/19/16.
//  Copyright © 2016 SuperCogs. All rights reserved.
//

import UIKit

class InstaUserProfileViewController: UserProfileViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        userProfile.actionButton.type = .Follow
        userProfile.actionStatusBar.addSocialActionButtons([.Instagram, .Facebook, .Dribbble, .Twitter, .Tumblr])
    }

}
