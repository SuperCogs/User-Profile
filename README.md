
# User Profile by SuperCogs

**SuperCogsUserProfile** library that allows you to create and customize your user profile which is professionally design to fit your purposes.
Features:

 - Swiping up into a navigation bar look for accessing the profile content.
 - Tapping the profile photo expands it to full size.
 - Customizable action button with transitions between states.
 - Info bar with predefined or custom actions or information.
 - Background photo parallax effect.
 
**SuperCogsUserProfile** can be used with both Swift and Objective-C projects.

## Requirements

- iOS 9.0+
- Xcode 7.3
- You need Gotham font to use the Gotham layout. However, free alternatives are included.

## Setup your project

Add the **SuperCogsUserProfile** folder to your project.
Create a bridging header for your project and add:

``` Objective-C
#import "SocialButtons.h"
```

## Usage

###Basic

`SuperCogsUserProfileView` is a subclass of a `UIView` and can be used in the project in two ways:

 - Creating it from code using it's designated initializer.
 - Adding a view in Storyboard and assigning the `SuperCogsUserProfileView` class in the Identity inspector.

With both ways the created profile views should take the whole screen, since that is what it is designed for.
You can chose to set the look of your profile to be Normal or Compact after creating it (Normal is default).
After this there is a number of public properties that can be set for customizing the look of your profile. These properties can be set both from code and in Atributes inspector if you are using storyboards.

###Delegate

`SuperCogsUserProfileViewDelegate` is an optional delegate used to receive an event when the navigation back button is tapped on the profile view.

``` swift
@objc public protocol SuperCogsUserProfileViewDelegate
{
    optional func navigationBackButtonTapped(backButton: UIButton)
}
```

Navigation back button can be accessed through the public property:

``` swift
public private(set) var navigationBackButton
```

###Action Button

Action Button is of type `TwoStateActionButton` which is a subclass of a `UIButton` and can be accessed through the public property of `SuperCogsUserProfileView`.

``` swift
public private(set) var actionButton
```

It is used for common actions on a profile like Following, Subscribing...
It has several predefined types that can be set or it can be Custom.

``` swift
@objc public enum TwoStateActionButtonType: UInt
{
    case Follow = 0, Subscribe, Connect, AddFriend, CheckIn, Custom
}
```

There is an optional delegate `TwoStateActionButtonDelegate` used for receiving events when the action button is tapped.

``` swift
@objc public protocol TwoStateActionButtonDelegate
{
    optional func actionButtonTapped(actionButton: TwoStateActionButton)
}
```

###Action Status Bar

Action Status Bar is of type `ActionStatusBarView` which is a subclass of a `UIView` and can be accessed through the public property of `SuperCogsUserProfileView`.

``` swift
public private(set) var actionStatusBar
```

It is used for displaying additional actions with buttons or combining both small info with button action.
It has several predefined types of buttons that can be displayed in the status bar or it can be Custom.

``` swift
@objc private enum ActionStatusBarType: UInt
{
    case Action = 0, Info, InfoProffesional, Custom
}
```

The type is not set directly but is inferred based on what buttons are set in the status bar using one of these methods:

``` swift
public func addSocialActionButtons(socialActionButtons: SocialActionButtons)

public func addSocialInfoButtons(socialInfoButtons: SocialInfoButtons)

public func addSocialInfoProffesionalButtons(socialInfoProffesionalButtons: SocialInfoProfessionalButtons)

public func addCustomButtons(customButtons: Array<UIButton>)
```

Posible values of `SocialActionButtons`, `SocialInfoButtons` and `SocialInfoProfessionalButtons` are defined in `SocialButtons.h` file.

There is an optional delegate `ActionStatusBarDelegate` used for receiving events when some button is tapped in the status bar, sending which one it was.

``` swift
@objc public protocol ActionStatusBarDelegate
{
    optional func socialActionButtonTapped(actionButton: SocialActionButtons)
    optional func socialInfoButtonTapped(infoButton: SocialInfoButtons)
    optional func socialInfoProffesionalButtonTapped(infoButton: SocialInfoProffesionalButtons)
}
```

###Timeline

You can set a timeline-like view using a public property of `SuperCogsUserProfileView`.

``` swift
public var timelineView: UIView?
```

For more info on timeline view, see the demo project.

## Licence

See the LICENSE.txt file.


## Support & About
Need help? [support@supercogs.io](mailto:support@supercogs.io)

Designend and developed by [SuperCogs](https://supercogs.io).