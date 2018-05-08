//
//  AppDelegate.m
//  BemVindo
//
//  Created by Ricardo Lecheta on 11/19/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "AppDelegate.h"
#import "MeuPrimeiroViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    // Cria o viewcontroller principal
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        // iPhone
        MeuPrimeiroViewController *vc = [[MeuPrimeiroViewController alloc]
                                         initWithNibName:@"MeuPrimeiroViewController" bundle:nil];
        self.window.rootViewController = vc;
    } else {
        // iPad
        MeuPrimeiroViewController *vc = [[MeuPrimeiroViewController alloc]
                                         initWithNibName:@"MeuPrimeiroViewController_iPad" bundle:nil];
        self.window.rootViewController = vc;
    }
    
    return YES;
}

@end
