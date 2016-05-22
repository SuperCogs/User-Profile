//
//  UserProfileViewController.swift
//  UserProfile
//
//  Created by Milos on 4/18/16.
//  Copyright © 2016 SuperCogs. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController, SuperCogsUserProfileViewDelegate, ActionStatusBarDelegate
{
    
    @IBOutlet weak var userProfile: SuperCogsUserProfileView!
    var selectedLook: SocialProfileViewLook = .Normal
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userProfile.profileViewLook = selectedLook
        userProfile.delegate = self
        userProfile.actionStatusBar.delegate = self
        
        let orientation = UIApplication.sharedApplication().statusBarOrientation
        setTimelineViewForCurrentDeviceOrientation(orientation == .LandscapeRight || orientation == .LandscapeLeft)
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle
    {
        return .LightContent
    }
    
    override func viewWillAppear(animated: Bool)
    {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func navigationBackButtonTapped(backButton: UIButton)
    {
        navigationController?.popViewControllerAnimated(true)
    }
    
    var message: String?
    
    func socialActionButtonTapped(actionButton: SocialActionButtons)
    {
        switch actionButton
        {
        case SocialActionButtons.Instagram:
            message = "Instagram"
        case SocialActionButtons.Tumblr:
            message = "Tumblr"
        case SocialActionButtons.Dribbble:
            message = "Dribbble"
        case SocialActionButtons.Facebook:
            message = "Facebook"
        case SocialActionButtons.Twitter:
            message = "Twitter"
        default:
            message = nil
        }
        performSegueWithIdentifier("socialButton", sender: self)
    }
    
    func socialInfoButtonTapped(infoButton: SocialInfoButtons)
    {
        switch infoButton
        {
        case SocialInfoButtons.Like:
            message = "Likes"
        case SocialInfoButtons.Comment:
            message = "Comments"
        case SocialInfoButtons.Break:
            message = "Breaks"
        default:
            message = nil
        }
        performSegueWithIdentifier("socialButton", sender: self)
    }
    
    func socialInfoProfessionalButtonTapped(infoButton: SocialInfoProfessionalButtons)
    {
        switch infoButton
        {
        case SocialInfoProfessionalButtons.Articles:
            message = "Articles"
        case SocialInfoProfessionalButtons.Connections:
            message = "Connections"
        case SocialInfoProfessionalButtons.Groups:
            message = "Groups"
        case SocialInfoProfessionalButtons.Posts:
            message = "Posts"
        case SocialInfoProfessionalButtons.Problems:
            message = "Problems"
        default:
            message = nil
        }
        performSegueWithIdentifier("socialButton", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "socialButton"
        {
            if let testVC = segue.destinationViewController as? SocialInfoViewController
            {
                testVC.infoText = message
            }
        }
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator)
    {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        setTimelineViewForCurrentDeviceOrientation(size.width > size.height)
    }
    
    
    func setTimelineViewForCurrentDeviceOrientation(landscape: Bool)
    {
        if (UIDevice.currentDevice().userInterfaceIdiom == .Phone && !landscape) ||
            (UIDevice.currentDevice().userInterfaceIdiom == .Pad && landscape && userProfile.profileViewLook == .Normal)
        {
            setTimelineForImageNamed("timeline-small")
        }
        else
        {
            setTimelineForImageNamed("timeline-big")
        }
    }
    
    func setTimelineForImageNamed(named: String)
    {
        if let image = UIImage(named: named)
        {
            let timeline = UIImageView()
            timeline.image = image
            timeline.sizeToFit()
            timeline.contentMode = .ScaleToFill
            userProfile.timelineView = timeline
        }
    }

}
