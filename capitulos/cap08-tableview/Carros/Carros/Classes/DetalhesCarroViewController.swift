//
//  DetalhesCarroViewController.swift
//  Carros
//
//  Created by Ricardo Lecheta on 7/11/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import UIKit

class DetalhesCarroViewController: UIViewController {

    @IBOutlet var img : UIImageView!
    @IBOutlet var tDesc : UITextView!

    var carro: Carro?

    init() {
        super.init(nibName: "DetalhesCarroViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let c = carro {
            self.title = c.nome
            
            self.tDesc.text = c.desc;
            
            let img = UIImage(named: c.url_foto)
            self.img.image =  img
        }
    }
}
