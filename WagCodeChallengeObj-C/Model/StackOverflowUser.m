//
//  StackOverflowUser.m
//  WagCodeChallengeObj-C
//
//  Created by Taylor Bills on 6/4/18.
//  Copyright © 2018 Taylor Bills. All rights reserved.
//

#import "StackOverflowUser.h"

@implementation StackOverflowUser

#pragma mark -  Initializers

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        NSArray *itemsDictionaries = dictionary[@"items"];
        for (NSDictionary *user in itemsDictionaries) {
            NSString *username = user[@"display_name"];
            NSString *gravatarURL = user[@"profile_image"];
            NSArray *badgeCountArray = user[@"badge_counts"];
            for (NSDictionary *badgeCounts in badgeCountArray) {
                NSNumber *bronzeBadgeCount = badgeCounts[@"bronze"];
                NSNumber *silverBadgeCount = badgeCounts[@"silver"];
                NSNumber *goldBadgeCount = badgeCounts[@"gold"];
                
                _username = username;
                _gravatarURL = gravatarURL;
                _bronzeBadgeCount = bronzeBadgeCount;
                _silverBadgeCount = silverBadgeCount;
                _goldBadgeCount = goldBadgeCount;
            }
        }
    }
    return self;
}

@end
