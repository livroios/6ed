//
//  DetalhesCarroViewController.swift
//  Carros
//
//  Created by Ricardo Lecheta on 7/11/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import UIKit

class DetalhesCarroViewController: UIViewController {
    
    @IBOutlet var img : DownloadImageView!
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
            
            //var img = UIImage(named: c.url_foto)
            //self.img.image = img
        
            self.img.setUrl(c.url_foto, cache: true)
        }
    }
    
    // Controlar a troca de orientação (vertical/horizontal)
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        print("viewWillTransitionToSize \(size)")
        
        if(size.width > size.height) {
            print("Horizontal")
            tDesc.isHidden = true
            
            // Horizontal: Esconde tudo
            self.tabBarController!.tabBar.isHidden = true
            self.navigationController!.navigationBar.isHidden = true
        } else {
            print("Vertical")
            
            // Vertical: Mostra tudo
            self.tabBarController!.tabBar.isHidden = false
            self.navigationController!.navigationBar.isHidden = false
            
            tDesc.isHidden = false
        }
        
        // Atualiza o status da action bar
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    
}
