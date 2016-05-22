//
//  SocialButtons.h
//  SocialProfilePage
//
//  Created by Milos on 3/20/16.
//  Copyright © 2016 SuperCogs. All rights reserved.
//

#ifndef SocialButtons_h
#define SocialButtons_h

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSInteger, SocialActionButtons) {
    SocialActionButtonsInstagram = (1 << 0),
    SocialActionButtonsTumblr = (1 << 1),
    SocialActionButtonsDribbble = (1 << 2),
    SocialActionButtonsFacebook = (1 << 3),
    SocialActionButtonsTwitter = (1 << 4)
};

typedef NS_OPTIONS(NSInteger, SocialInfoButtons) {
    SocialInfoButtonsLike = (1 << 0),
    SocialInfoButtonsComment = (1 << 1),
    SocialInfoButtonsBreak = (1 << 2)
};

typedef NS_OPTIONS(NSInteger, SocialInfoProfessionalButtons) {
    SocialInfoProfessionalButtonsArticles = (1 << 0),
    SocialInfoProfessionalButtonsConnections = (1 << 1),
    SocialInfoProfessionalButtonsGroups = (1 << 2),
    SocialInfoProfessionalButtonsPosts = (1 << 3),
    SocialInfoProfessionalButtonsProblems = (1 << 4)
};

#endif /* SocialButtons_h */
