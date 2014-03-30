//
//  AppDelegate.h
//  Parsing Game
//
//  Created by Irene Knapp on 3/29/14.
//  Copyright (c) 2014 Irene Knapp. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
@property (assign) void *applicationState;
@property (assign) IBOutlet NSWindow *window;

- (void) applicationWillFinishLaunching: (NSNotification *) notification;
- (void) applicationWillTerminate: (NSNotification *) notification;
@end
