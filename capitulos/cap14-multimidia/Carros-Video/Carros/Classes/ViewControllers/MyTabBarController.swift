//
//  MyTabBarController.swift
//  Carros
//
//  Created by Ricardo Lecheta on 7/14/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {

    override var supportedInterfaceOrientations : UIInterfaceOrientationMask  {
        // Delega para o view controller selecionado na Tab
        return self.selectedViewController!.supportedInterfaceOrientations
    }
}
