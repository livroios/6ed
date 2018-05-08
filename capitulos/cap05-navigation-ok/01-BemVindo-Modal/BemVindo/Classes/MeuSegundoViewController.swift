//
//  MeuSegundoViewController.swift
//  BemVindo
//
//  Created by Ricardo Lecheta on 28/04/18.
//  Copyright © 2018 Ricardo Lecheta. All rights reserved.
//

import UIKit

class MeuSegundoViewController: UIViewController {
    
    // Label desenhado xib xib
    @IBOutlet var label : UILabel!

    // Mensagem que será passada como parâmetro
    var msg = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Copia o conteúdo da mensagem "msg" para o label
        label.text = msg
    }

    // Fecha este view controller
    @IBAction func voltar(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
