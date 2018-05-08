//
//  AppDelegate.swift
//  Carros
//
//  Created by Ricardo Lecheta on 7/11/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import UIKit
import MapKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?
    
    var listaController: ListaCarrosViewController?
    var detalhesController: DetalhesCarroViewController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.backgroundColor = UIColor.white
        
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()

        let iPad = Utils.isIpad()
        if(iPad) {
            self.initIPad()
        } else {
            self.initIphone()
        }
        
        // SQLite
        print("Criando banco de dados...")
        let db = CarroDB()
        db.createTables()
        print("Banco de dados criado com sucesso.")
        
        self.window!.makeKeyAndVisible()

        return true
    }

    func initIphone() {
        let listaController = ListaCarrosViewController()
        let sobreController = SobreViewController()
        
        let nav1 = MyNavigationController()
        let nav2 = MyNavigationController()

        nav1.pushViewController(listaController, animated: false)
        nav2.pushViewController(sobreController, animated: false)
        
        let tabBarController = MyTabBarController()
        tabBarController.viewControllers = [nav1,nav2]
        
        nav1.tabBarItem.title = "Carros"
        nav1.tabBarItem.image = UIImage(named:"tab_carros.png")
        nav2.tabBarItem.title = "Sobre"
        nav2.tabBarItem.image = UIImage(named:"tab_sobre.png")
        
        self.window!.rootViewController = tabBarController

    }

    func initIPad() {
        // Cria os controllers da Esquerda e Direita
        detalhesController = DetalhesCarroViewController(nibName:"DetalhesCarroViewController_iPad", bundle: nil)
        listaController = ListaCarrosViewController()

        let nav1 = MyNavigationController()
        let nav2 = MyNavigationController()

        nav1.pushViewController(listaController!, animated: false)
        nav2.pushViewController(detalhesController!, animated: false)

        // Cria o UISplitViewController
        let split = UISplitViewController()
        split.delegate = detalhesController
        split.viewControllers = [nav1, nav2]

        // Deixa o UISplitViewController como o controller principal
        self.window!.rootViewController = split
    }
}

