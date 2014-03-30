//
//  AppDelegate.m
//  Parsing Game
//
//  Created by Irene Knapp on 3/29/14.
//  Copyright (c) 2014 Irene Knapp. All rights reserved.
//

#import "AppDelegate.h"
#import "../dist/build/ParsingGame/Foreign_stub.h"

@implementation AppDelegate

- (void) applicationWillFinishLaunching: (NSNotification *) notification
{
    int hsArgc = 1;
    char **hsArgv = malloc(sizeof(char *));
    hsArgv[0] = "Parsing Game";
    hs_init(&hsArgc, &hsArgv);
    free(hsArgv);
    
    [self setApplicationState: parsingGameApplicationInit()];
    if(![self applicationState]) {
        goto error;
    }
    
    return;
    
error:
    NSLog(@"Failed to initialize application.");
    exit(0);
}


- (void) applicationWillTerminate: (NSNotification *) notification {
    if(![self applicationState])
        return;
    
    parsingGameApplicationExit([self applicationState]);
    hs_exit();
    [self setApplicationState: NULL];
}

@end
