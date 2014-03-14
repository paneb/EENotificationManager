//
//  EENotificationManager.h
//
//  Created by Francesco Cabras on 02.12.13.
//  The MIT License (MIT)
//  Copyright (c) 2013 Francesco Cabras francesco.cabras@gmail.com
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "EENotificationManager.h"

@implementation EENotificationManager

-(id) init
{
    self = [super init];
    if(self){
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stateDidChange:) name:EMIT_CHANGE object:nil];
    }
    return self;
}

+ (id)sharedInstance
{
    // structure used to test whether the block has completed or not
    static dispatch_once_t p = 0;
    
    // initialize sharedObject as nil (first call only)
    __strong static id _sharedObject = nil;
    
    // executes a block object once and only once for the lifetime of an application
    dispatch_once(&p, ^{
        _sharedObject = [[self alloc] init];
    });
    
    // returns the same object each time
    return _sharedObject;
}

#pragma mark - Observers
- (void)addStateObserver:(NSObject<EENotificationProtocol>*)observer
{
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:@selector(stateDidChange:) name:RECEIVE_CHANGE object:nil];
}

- (void)removeStateObserver:(NSObject<EENotificationProtocol>*)observer
{
    [[NSNotificationCenter defaultCenter] removeObserver:observer name:RECEIVE_CHANGE object:nil];
}

#pragma mark - ApplicationStateObserver
- (void)stateDidChange:(NSNotification *)notification{
    
    
    //NSInteger state = [((NSNumber*)[[notification userInfo] objectForKey:@"state"]) longValue];
    
    NSNotification *myNotification = [NSNotification notificationWithName:RECEIVE_CHANGE object:self userInfo:[notification userInfo]];
    [[NSNotificationQueue defaultQueue] enqueueNotification:myNotification postingStyle:NSPostNow];
}

#pragma mark - Event Management
- (void) willChangeState:(NSUInteger)state withUserDict:(NSDictionary*)userDict andPostingStyle:(NSPostingStyle)postingStyle
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithLong:state], @"state", userDict, @"userDict", [NSNumber numberWithInt:postingStyle], @"postingStyle", nil];
    [self performSelectorOnMainThread:@selector(willChangeStateWithDictOnMainThread:) withObject:dict waitUntilDone:YES];
    
}

- (void)willChangeStateWithDictOnMainThread:(NSDictionary*)dict
{
    NSInteger state = [[dict valueForKey:@"state"] intValue];
    NSDictionary *userDict = [dict valueForKey:@"userDict"];
    
    NSMutableDictionary *resultDict = [NSMutableDictionary dictionaryWithObject:[NSNumber numberWithLong:state] forKey:@"state"];
    if (userDict){
        [resultDict addEntriesFromDictionary:userDict];
    }
    
    NSNotification *myNotification = [NSNotification notificationWithName:EMIT_CHANGE object:self userInfo:resultDict];
    [[NSNotificationQueue defaultQueue] enqueueNotification:myNotification postingStyle:NSPostNow];
}

@end

