//
//  ViewController.swift
//  OlaStoryboard
//
//  Created by Ricardo Lecheta on 29/04/18.
//  Copyright © 2018 Ricardo Lecheta. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // nada aqui...
    }
    @IBAction func fechar(_ sender: UIButton) {
        // Fecha este view controller
        dismiss(animated: true)
    }
}

