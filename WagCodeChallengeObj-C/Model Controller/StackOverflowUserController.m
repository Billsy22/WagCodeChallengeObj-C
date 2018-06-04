//
//  StackOverflowUserController.m
//  WagCodeChallengeObj-C
//
//  Created by Taylor Bills on 6/4/18.
//  Copyright © 2018 Taylor Bills. All rights reserved.
//

#import "StackOverflowUserController.h"

NS_ASSUME_NONNULL_BEGIN
#pragma mark -  interface

@interface StackOverflowUserController()

@property(nonatomic, strong) NSMutableArray *internalUsers;

@end

#pragma mark -  Constants

static NSString * const baseURLString = @"https://api.stackexchange.com/2.2/users?site=stackoverflow";

#pragma mark -  implementation

@implementation StackOverflowUserController

+ (StackOverflowUserController *)shared
{
    static StackOverflowUserController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [StackOverflowUserController new];
    });
    return shared;
}

#pragma mark -  Fetch Methods

- (void)fetchStackOverflowUsers:(void (^)(NSArray<StackOverflowUser *> * _Nullable))completion
{
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:[NSURL URLWithString:baseURLString] resolvingAgainstBaseURL: YES];
    NSURL *finalURL = [urlComponents URL];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching movies: %@", [error localizedDescription]);
            return;
        }
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        if (!jsonDictionary) {
            NSLog(@"Error with the json return: %@", [error localizedDescription]);
            return;
        }
        StackOverflowUser *user = [[StackOverflowUser alloc] initWithDictionary:jsonDictionary];
        NSMutableArray *users = [NSMutableArray array];
        [users addObject:user];
        self.users = users;
        completion(users);
    }] resume];
}

@end
NS_ASSUME_NONNULL_END
