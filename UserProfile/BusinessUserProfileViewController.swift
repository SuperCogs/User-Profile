//
//  BusinessUserProfileViewController.swift
//  UserProfile
//
//  Created by Milos on 4/17/16.
//  Copyright © 2016 SuperCogs. All rights reserved.
//

import UIKit

class BusinessUserProfileViewController: UserProfileViewController
{
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        userProfile.actionButton.type = .CheckIn
        userProfile.actionStatusBar.addSocialActionButtons([.Instagram, .Facebook, .Dribbble, .Twitter, .Tumblr])
    }

}
