//
//  AppDelegate.swift
//  HelloRemoteNotification
//
//  Created by Ricardo Lecheta on 7/6/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let settings = UIUserNotificationSettings(types: [.sound, .alert, .badge], categories: nil)

        // Solicitia permissão do usuário
        application.registerUserNotificationSettings(settings)

        print("registerForRemoteNotifications() ")
        
        return true
    }

    func application(_ application: UIApplication, didRegister notificationSettings: UIUserNotificationSettings) {
    
        print("register \(notificationSettings)")
        
        // Faz o registro para receber remote notifications
        application.registerForRemoteNotifications()
    }
    
    // Fez o registro para receber o Push.
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // Aqui imprime o device token único deste dispositivo
        print("didRegisterForRemoteNotificationsWithDeviceToken \(deviceToken)")
    }

    // Falhou para registrar
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("didFailToRegisterForRemoteNotificationsWithError \(error)")
    }

    // Recebeu uma mensagem de Push
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any])
    {
        print("didReceiveRemoteNotification \(userInfo)")
        
        // userInfo é um NSDictionary
        let dict = userInfo as NSDictionary
        
        // Lê o json dentro de aps { }
        let notification:NSDictionary = dict.object(forKey: "aps") as! NSDictionary
        
        // Json da notificação
        print("notification \(notification)")
        
    }

}

