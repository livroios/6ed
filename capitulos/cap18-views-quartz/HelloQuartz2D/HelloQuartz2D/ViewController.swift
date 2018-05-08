//
//  ViewController.swift
//  HelloQuartz2D
//
//  Created by Ricardo Lecheta on 7/6/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Adiciona a view
        let largura = self.view.frame.size.width
        let altura = self.view.frame.size.height

        self.view = ViewLegal(frame: CGRect(x: 0,y:0, width: largura/2, height:altura/2))
    }
}

