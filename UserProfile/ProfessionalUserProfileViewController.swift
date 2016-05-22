//
//  ProfessionalUserProfileViewController.swift
//  UserProfile
//
//  Created by Milos on 4/19/16.
//  Copyright © 2016 SuperCogs. All rights reserved.
//

import UIKit

class ProfessionalUserProfileViewController: UserProfileViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        userProfile.actionButton.type = .Connect
        setSocialInfoProfessionalButtons()
    }
    
    func setSocialInfoProfessionalButtons()
    {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone ||
            (UIDevice.currentDevice().userInterfaceIdiom == .Pad && userProfile.profileViewLook == .Compact)
        {
            userProfile.actionStatusBar.addSocialInfoProfessionalButtons([.Articles, .Groups, .Connections])
        }
        else
        {
            userProfile.actionStatusBar.addSocialInfoProfessionalButtons([.Articles, .Groups, .Connections, .Problems, .Posts])
        }
        
        userProfile.actionStatusBar.setValue("4.234", forInfoProfessionalButton: .Articles)
        userProfile.actionStatusBar.setValue("3.992", forInfoProfessionalButton: .Groups)
        userProfile.actionStatusBar.setValue("6.144", forInfoProfessionalButton: .Connections)
        userProfile.actionStatusBar.setValue("4.391", forInfoProfessionalButton: .Posts)
        userProfile.actionStatusBar.setValue("99", forInfoProfessionalButton: .Problems)
    }

}
