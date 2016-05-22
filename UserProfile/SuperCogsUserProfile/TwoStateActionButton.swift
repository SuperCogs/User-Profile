//
//  TwoStateActionButton.swift
//  TestSwipeView
//
//  Created by Milos Tabakovic on 3/22/16.
//  Copyright © 2016 SuperCogs. All rights reserved.
//

import UIKit

/// An enum defining the posible types of the TwoStateActionButton.
@objc public enum TwoStateActionButtonType: UInt
{
    case Follow = 0, Subscribe, Connect, AddFriend, CheckIn, Custom
}

/// An enum defining the posible styles of the TwoStateActionButton.
@objc enum TwoStateActionButtonStyle: UInt
{
    case Normal = 0, Circle
}

/// The delegate of a TwoStateActionButton object must adopt the TwoStateActionButtonDelegate protocol.
/// Optional method of the protocol allows the delegate to perform it's own actions when a button is tapped.
@objc public protocol TwoStateActionButtonDelegate
{
    optional func actionButtonTapped(actionButton: TwoStateActionButton)
}

/// A UIButton subclass that is used as a two state button in SuperCogsUserProfileView.
///
/// Based on the state that the button is in (Normal or Selected) it has different titles, images and background color.
@objc public class TwoStateActionButton: UIButton
{
    /// The object that acts as the delegate of the two state action button.
    ///
    /// The delegate must adopt the TwoStateActionButtonDelegate protocol. The delegate is not retained.
    weak public var delegate: TwoStateActionButtonDelegate?
    
    /// Used by SuperCogsUserProfileView for setting the style of the button.
    /// - Important: Should not be set directly.
    var style: TwoStateActionButtonStyle = .Normal
    
    /// A property for setting the type of two state action button.
    /// It can be one of five predefined types or a custom button.
    /// The types are deffined in the TwoStateActionButtonType enum.
    /// Default type is .Follow
    ///
    /// If type set to .Custom, properties **customTitleNormal**, **customTitleSelected** must be set also, and optionaly set the **customImageNameNormal** and **customImageNameSelected** properties.
    public var type: TwoStateActionButtonType = .Follow
    
    /// Used by SuperCogsUserProfileView for setting the color of the button in Normal state.
    /// - Important: Should not be set directly.
    var normalButtonColor: UIColor?
    
    /// Used by SuperCogsUserProfileView for setting the color of the button in Selected state.
    /// - Important: Should not be set directly.
    var selectedButtonColor: UIColor?
    
    /// Used by SuperCogsUserProfileView for setting the font of the button title.
    /// - Important: Should not be set directly.
    var buttonFont: UIFont?
    
    /// A title that is used for the Normal button state of **type** .Costom
    public var customTitleNormal: String?
    
    /// A title that is used for the Selected button state of **type** .Costom
    public var customTitleSelected: String?
    
    /// An image that is used for the Normal button state of **type** .Costom
    public var customImageNameNormal: String = ""
    
    /// A image that is used for the Selected button state of **type** .Costom
    public var customImageNameSelected: String = ""
}
