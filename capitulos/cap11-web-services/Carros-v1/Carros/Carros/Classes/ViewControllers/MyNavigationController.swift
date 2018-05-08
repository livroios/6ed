//
//  MyNavigationController.swift
//  Carros
//
//  Created by Ricardo Lecheta on 7/14/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import UIKit

class MyNavigationController: UINavigationController {
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask  {
        // Delega para o view controller atual (é o último do array)
        return self.topViewController!.supportedInterfaceOrientations
    }
}
