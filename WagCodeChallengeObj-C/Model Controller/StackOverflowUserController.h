//
//  StackOverflowUserController.h
//  WagCodeChallengeObj-C
//
//  Created by Taylor Bills on 6/4/18.
//  Copyright © 2018 Taylor Bills. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StackOverflowUser.h"

@interface StackOverflowUserController : NSObject
NS_ASSUME_NONNULL_BEGIN

#pragma mark -  Properties

@property(nonatomic, copy) NSArray<StackOverflowUser *> *users;
@property(nonatomic, copy) NSDictionary *gravatarImages;
+ (StackOverflowUserController *)shared;

#pragma mark -  Fetch Methods

- (void)fetchStackOverflowUsers:(void(^)(NSArray<StackOverflowUser *> *_Nullable))completion;
- (void)fetchGravatarForUser:(StackOverflowUser *)user completion:(void(^)(NSData *_Nullable))completion;

NS_ASSUME_NONNULL_END
@end
