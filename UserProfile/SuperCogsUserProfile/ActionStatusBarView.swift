//
//  ActionStatusBarView.swift
//  SocialProfilePage
//
//  Created by Milos on 2/27/16.
//  Copyright © 2016 SuperCogs. All rights reserved.
//

import UIKit

/// The delegate of a ActionStatusBarView object must adopt the ActionStatusBarDelegate protocol.
/// Optional methods of the protocol allow the delegate to perform it's own actions when a button in the action status bar is tapped.
@objc public protocol ActionStatusBarDelegate
{
    optional func socialActionButtonTapped(actionButton: SocialActionButtons)
    optional func socialInfoButtonTapped(infoButton: SocialInfoButtons)
    optional func socialInfoProfessionalButtonTapped(infoButton: SocialInfoProfessionalButtons)
}

/// A UIView subclass used as an action status bar on the bottom of the SuperCogsUserProfileView.
///
/// Can have three predefined types: Action, Info and InfoProfessional or can have completely custom buttons added.
/// For all of the three types there is a list of buttons that can be showen in the status bar.
@objc public class ActionStatusBarView: UIView
{
    /// The object that acts as the delegate of the action status bar view.
    ///
    /// The delegate must adopt the ActionStatusBarDelegate protocol. The delegate is not retained.
    weak public var delegate: ActionStatusBarDelegate?
    
    /// Calculates and sets the spacing between buttons based on the width parameter.
    /// - parameter width: A width of the view based on which spacing is calculated.
    
    // MARK: Social Action Buttons
    
    /// Adds action buttons in the action status bar view.
    /// - parameter socialActionButtons: An OptionSetType of action button types that will be added and shown in the action status bar.
    /// The possible values are defined in **SocialActionButtons**.
    public func addSocialActionButtons(socialActionButtons: SocialActionButtons)
    {
        
    }
    
    // MARK: Social Info Buttons
    
    /// Adds social info buttons in the action status bar view.
    /// - parameter socialInfoButtons: An OptionSetType of social info button types that will be added and shown in the action status bar.
    /// The possible values are defined in **SocialInfoButtons**.
    public func addSocialInfoButtons(socialInfoButtons: SocialInfoButtons)
    {
        
    }
    
    /// Setting the value that is shown in the social info button.
    /// - Parameters:
    ///     - value: An Int value that will be shown.
    ///     - info: A type of social info button that will show the value parameter.
    ///             The possible values are defined in **SocialInfoButtons**.
    public func setValue(value: String?, forInfoButton info: SocialInfoButtons)
    {
        
    }
    
    // MARK: Social Info Professional Buttons
    
    /// Adds social info professional buttons in the action status bar view.
    /// - parameter socialInfoProfessionalButtons: An OptionSetType of social info professional button types that will be added and shown in the action status bar.
    /// The possible values are defined in **SocialInfoProfessionalButtons**.
    public func addSocialInfoProfessionalButtons(socialInfoProfessionalButtons: SocialInfoProfessionalButtons)
    {
        
    }
    
    /// Setting the value that is shown in the social info professional button.
    /// - Parameters:
    ///     - value: An Int value that will be shown.
    ///     - info: A type of social info professional button that will show the value parameter.
    ///             The possible values are defined in **SocialInfoProfessionalButtons**.
    public func setValue(value: String?, forInfoProfessionalButton info: SocialInfoProfessionalButtons)
    {
        
    }
    
    // MARK: Custom Buttons
    
    /// Adds custom buttons in the action status bar view.
    /// - parameter customButtons: An array of UIButtons that will be added and shown in the action status bar.
    public func addCustomButtons(customButtons: Array<UIButton>)
    {
        
    }

}
