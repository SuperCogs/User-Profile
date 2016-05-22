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
    
    private struct Constants {
        static let nameFontSizePhoneNormal: CGFloat = 30.0
        static let nameFontSizePadNormal: CGFloat = 40.0
        static let nameFontSizePhoneCompact: CGFloat = 25.0
        static let nameFontSizePadCompact: CGFloat = 36.0
        static let nameFontSizeBar: CGFloat = 18.0
        
        static let infoFontSize: CGFloat = 11.0
        static let actionButtonFontSize: CGFloat = 12.0
        static let actionBarFontSize: CGFloat = 24.0
        
        static let widthProfileViewLandscapePadNormal: CGFloat = 640.0
        static let widthProfileViewLandscapePadCompact: CGFloat = 384.0
        static let heightProfileViewPhoneNormal: CGFloat = 491.0
        static let heightProfileViewPadNormal: CGFloat = 768.5
        static let heightProfileViewPhoneCompact: CGFloat = 224.0
        static let heightProfileViewPadCompact: CGFloat = 384.0
        static let heightProfileViewBar: CGFloat = 64.0
        
        static let navigationBackButtonTop: CGFloat = 20.0
        static let navigationBackButtonWidth: CGFloat = 30.0
        static let navigationBackButtonHeight: CGFloat = 44.0
        
        static let profileImageSelectedBorderWidth: CGFloat = 29.0
        static let profileImageHeightWidthPad: CGFloat = 228.0
        static let profileImageHeightWidthPhone: CGFloat = 156.0
        static let profileImageTopPadNormal: CGFloat = 136.0
        static let profileImageTopPhoneNormal: CGFloat = 69.0
        static let profileImageTopLandscapePadCompact: CGFloat = 120.5
        static let profileImageTopPadCompact: CGFloat = 30.0
        static let profileImageTopPhoneCompact: CGFloat = 0.0
        static let profileImageTopBar: CGFloat = 64.0
        static let profileImageScaleNormal: CGFloat = 1.0
        static let profileImageScaleLandscapePadCompact: CGFloat = 0.65
        static let profileImageScalePadCompact: CGFloat = 0.7
        static let profileImageScalePhoneCompact: CGFloat = 0.5
        
        static let nameTopPadNormal: CGFloat = 398.0
        static let nameTopPhoneNormal: CGFloat = 241.0
        static let nameTopLandscapePadCompact: CGFloat = 349.0
        static let nameTopPadCompact: CGFloat = 242.0
        static let nameTopPhoneCompact: CGFloat = 133.0
        static let nameTopBar: CGFloat = 32.0
        
        static let additionalInfoTextKernValue: CGFloat = 2.2
        static let additionalInfoTopPadNormal: CGFloat = 460.0
        static let additionalInfoTopPhoneNormal: CGFloat = 289.0
        static let additionalInfoTopLandscapePadCompact: CGFloat = 407.0
        static let additionalInfoTopPadCompact: CGFloat = 304.0
        static let additionalInfoTopPhoneCompact: CGFloat = 171.0
        static let additionalInfoTopBar: CGFloat = 0.0
        static let additionalInfoImageTrailing: CGFloat = -8.0
        
        static let actionButtonTopPadNormal: CGFloat = 521.0
        static let actionButtonTopPhoneNormal: CGFloat = 336.0
        static let actionButtonTopLandscapePadCompact: CGFloat = 467.0
        static let actionButtonTopPadCompact: CGFloat = 365.0
        static let actionButtonTopPhoneCompact: CGFloat = 206.0
        static let actionButtonTopBar: CGFloat = 28.0
        
        static let actionStatusBarHeightPad: CGFloat = 96.0
        static let actionStatusBarHeightPhone: CGFloat = 75.0
        
        static let scrollChangeLookDistance: CGFloat = 75.0
        static let horizontalParalaxMoveDistance: CGFloat = 75.0
    }
    
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

