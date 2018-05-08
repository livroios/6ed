//
//  ListaCarrosViewController.swift
//  Carros
//
//  Created by Ricardo Lecheta on 7/11/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import UIKit

class ListaCarrosViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Título
        self.title = "Carros"
    }
    
    override func viewDidAppear(_ animated: Bool)  {
        super.viewDidAppear(animated)
        
//        self.navigationController.navigationBar.translucent = false
    
    }
}
