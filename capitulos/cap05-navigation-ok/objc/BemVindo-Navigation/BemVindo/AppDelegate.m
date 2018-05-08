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
    
    MeuPrimeiroViewController *vc = nil;
    // Cria o viewcontroller principal
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        // iPhone
        vc = [[MeuPrimeiroViewController alloc]
                                         initWithNibName:@"MeuPrimeiroViewController" bundle:nil];
    } else {
        // iPad
        vc = [[MeuPrimeiroViewController alloc]
                                         initWithNibName:@"MeuPrimeiroViewController_iPad" bundle:nil];
    }
    
    // Cria o navigation controller e o inicializa com o controller desejado
    UINavigationController *nav = [[UINavigationController alloc]
                                   initWithRootViewController:vc]; // Deixa o navigation controller como principal
    self.window.rootViewController = nav;
    
    return YES;
}

@end
