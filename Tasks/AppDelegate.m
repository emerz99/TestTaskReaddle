//
//  AppDelegate.m
//  Tasks
//
//  Created by Evgeny on 13.09.2022.
//  Copyright © 2022 Cultured Code. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    [self.window setRootViewController:[RootViewController new]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    
    
//    NSArray<NSString *> *arguments = [[NSProcessInfo processInfo] arguments];
//    if ([arguments containsObject:@"--ui-test-reset"]) {
//        NSString *defaultsName = [[NSBundle mainBundle] bundleIdentifier];
//        [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:defaultsName];
//    }
    
    return YES;
}

@end
