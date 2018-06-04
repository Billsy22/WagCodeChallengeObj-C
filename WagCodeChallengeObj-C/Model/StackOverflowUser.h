//
//  StackOverflowUser.h
//  WagCodeChallengeObj-C
//
//  Created by Taylor Bills on 6/4/18.
//  Copyright © 2018 Taylor Bills. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StackOverflowUser : NSObject

#pragma mark -  Properties

@property(nonatomic, nonnull) NSString *username;
@property(nonatomic, nonnull) NSNumber *bronzeBadgeCount;
@property(nonatomic, nonnull) NSNumber *silverBadgeCount;
@property(nonatomic, nonnull) NSNumber *goldBadgeCount;
@property(nonatomic, nullable) NSString *gravatarURL;

#pragma mark -  Initializer

- (instancetype _Nullable)initWithDictionary: (NSDictionary *)dictionary;

@end
