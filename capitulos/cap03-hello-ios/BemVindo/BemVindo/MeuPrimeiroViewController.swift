//
//  MeuPrimeiroViewController.swift
//  BemVindo
//
//  Created by Ricardo Lecheta on 26/04/18.
//  Copyright © 2018 Ricardo Lecheta. All rights reserved.
//

import UIKit
class MeuPrimeiroViewController: UIViewController {
    // Declar o outlet do label
    @IBOutlet var meuPrimeiroLabel : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Atualiza o texto
        meuPrimeiroLabel.text = "Tela iniciada com sucesso!"
    }
    
    @IBAction func oladMundo(_ sender: UIButton) {
        print("Olá Mundo")
        meuPrimeiroLabel.text = "Olá Mundo iPhone!"
    }
}
