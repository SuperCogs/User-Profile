//
//  MinimalUserProfileViewController.swift
//  UserProfile
//
//  Created by Milos on 4/19/16.
//  Copyright © 2016 SuperCogs. All rights reserved.
//

import UIKit

class MinimalUserProfileViewController: UserProfileViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        userProfile.actionButton.type = .Subscribe
        userProfile.actionStatusBar.addSocialInfoButtons([.Like, .Break, .Comment])
        userProfile.actionStatusBar.setValue("261", forInfoButton: .Break)
        userProfile.actionStatusBar.setValue("345", forInfoButton: .Like)
        userProfile.actionStatusBar.setValue("173", forInfoButton: .Comment)
    }

}
