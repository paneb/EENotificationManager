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


#import <Foundation/Foundation.h>
#import "TUBNotificationStates.h"

#define EMIT_CHANGE @"EMIT_CHANGE"
#define RECEIVE_CHANGE @"RECEIVE_CHANGE"

#pragma mark - notification protocol
@protocol TUBNotificationProtocol <NSObject>

- (void)stateDidChange:(NSNotification *)notification;

@end

#pragma mark - interfaces
@interface TUBNotificationManager : NSObject <TUBNotificationProtocol>

+ (id)sharedInstance;
- (void)addStateObserver:(NSObject<TUBNotificationProtocol>*)observer;
- (void)removeStateObserver:(NSObject<TUBNotificationProtocol>*)observer;

- (void) willChangeState:(NotificationState)state withUserDict:(NSDictionary*)userDict andPostingStyle:(NSPostingStyle)postingStyle;

@end
