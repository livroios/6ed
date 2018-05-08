//
//  AppDelegate.swift
//  BemVindo
//
//  Created by Ricardo Lecheta on 26/04/18.
//  Copyright © 2018 Ricardo Lecheta. All rights reserved.
//

import UIKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.backgroundColor = UIColor.white
        self.window!.makeKeyAndVisible()
        let iPad = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
        if(iPad) {
            // iPad
            let vc = MeuPrimeiroViewController(nibName:"MeuPrimeiroViewController_iPad", bundle: nil)
            self.window!.rootViewController = vc
        } else {
            // iPhone
            let vc = MeuPrimeiroViewController()
//            let nav = UINavigationController(rootViewController:vc)
            self.window!.rootViewController = vc
        }
        return true
    }
    func applicationWillResignActive(_ application: UIApplication) { }
    func applicationDidEnterBackground(_ application: UIApplication) { }
    func applicationWillEnterForeground(_ application: UIApplication) { }
    func applicationDidBecomeActive(_ application: UIApplication) { }
    func applicationWillTerminate(_ application: UIApplication) { }
}

