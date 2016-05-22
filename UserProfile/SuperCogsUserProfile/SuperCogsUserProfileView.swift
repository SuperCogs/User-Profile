//
//  SuperCogsUserProfileView.swift
//  SocialProfilePage
//
//  Created by Milos on 2/1/16.
//  Copyright © 2016 SuperCogs. All rights reserved.
//

import UIKit

/// An enum defining the posible looks of the SuperCogsUserProfileView.
@objc public enum SocialProfileViewLook : Int {
    case Normal
    case Compact
    case Bar        // Only for private use inside of SuperCogsSocialProfileView class
}

/// The delegate of a SuperCogsUserProfileView object must adopt the SuperCogsUserProfileViewDelegate protocol.
/// Optional method of the protocol allows the delegate to perform it's own actions when navigation back button is tapped.
@objc public protocol SuperCogsUserProfileViewDelegate
{
    optional func navigationBackButtonTapped(backButton: UIButton)
}

@IBDesignable
@objc public class SuperCogsUserProfileView: UIView, UIScrollViewDelegate
{
    // MARK: Public Properties
    
    /// The object that acts as the delegate of the user profile view.
    ///
    /// The delegate must adopt the SuperCogsUserProfileViewDelegate protocol. The delegate is not retained.
    weak public var delegate: SuperCogsUserProfileViewDelegate?
    
    /// Used for setting the look of user profile view to .Normal or .Compact.
    /// Look state .Bar not suported as a default look.
    public var profileViewLook: SocialProfileViewLook = .Normal
    
    /// Used for setting the cover photo of user profile view.
    @IBInspectable
    public var coverPhoto: UIImage? = UIImage()
    
    /// Used for setting the profile photo of user profile view.
    @IBInspectable
    public var profilePhoto: UIImage?
    
    /// Used for setting the string of the name label of user profile view.
    @IBInspectable
    public var name: String?
    
    /// Used for setting the color of the name label of user profile view.
    @IBInspectable
    public var nameColor: UIColor? = UIColor.whiteColor()
    
    /// Used for setting the font name of the name label of user profile view.
    @IBInspectable
    public var nameFontName: String = "Montserrat-Regular"
    
    /// Used for setting the string of the info label of user profile view.
    @IBInspectable
    public var infoText: String?
    
    /// Used for setting the color of the info label of user profile view.
    @IBInspectable
    public var infoColor: UIColor? = UIColor.whiteColor()
    
    /// Used for setting the font name of the info label of user profile view.
    @IBInspectable
    public var infoFontName: String = "Montserrat-Bold"
    
    /// Used for setting the icon for the info label of user profile view.
    @IBInspectable
    public var infoIcon: UIImage?
    
    /// Used for accessing the action button property of user profile view.
    /// It can be used for setting the delegate of the TwoStateActionButton.
    public private(set) var actionButton = TwoStateActionButton()
    /// Used for setting the color of the action button background when user profile view is in Normal look.
    @IBInspectable
    public var normalColorBackgroundActionButton: UIColor? = UIColor.whiteColor()
    /// Used for setting the color of the action button background when user profile view is in Compact look.
    @IBInspectable
    public var compactColorBackgroundActionButton: UIColor? = UIColor.grayColor()
    /// Used for setting the font name of the action button.
    @IBInspectable
    public var actionButtonFontName: String = "Montserrat-Regular"
    
    /// Used for accessing the action status bar property of user profile view.
    /// It can be used for setting the delegate of the ActionStatusBarView.
    public private(set) var actionStatusBar = ActionStatusBarView()
    /// Used for setting the font name of the action status bar.
    @IBInspectable
    public var actionBarFontName: String = "Montserrat-Regular"
    
    /// Used for accessing the navigation back button property of user profile view.
    /// It can be used for showing/hiding navigation back button.
    public private(set) var navigationBackButton = UIButton()
    
    /// Used for setting the timeline view of user profile view.
    public var timelineView: UIView?
    
    /// Enables or disables the horizontal paralax effect on the cover photo.
    public var horizontalParallaxEffectEnabled = true
    
}

