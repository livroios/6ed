//
//  ViewController.swift
//  HelloGestosDinamics
//
//  Created by Ricardo Lecheta on 7/6/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollisionBehaviorDelegate {
    
    @IBOutlet var imagem : UIImageView!
    
    var animator : UIDynamicAnimator!
    
    var items: Array<UIDynamicItem>!
                            
    override func viewDidLoad() {
        super.viewDidLoad()

        // Array para passar no construtor das classes UIGravityBehavior/UICollisionBehavior
        items = [self.imagem!]
    }
    
    @IBAction func testeGravidade() {
        print("testeGravidade")
        
        let gravidade = UIGravityBehavior(items: self.items)
        self.animator = UIDynamicAnimator(referenceView: self.view)
        self.animator.addBehavior(gravidade)
    }


    @IBAction func testeGravidadeEColisao() {
        print("testeGravidadeEColisao")
        
        // Gravidade
        let gravidade = UIGravityBehavior(items: self.items)
        let colisao = UICollisionBehavior(items: self.items)
        colisao.translatesReferenceBoundsIntoBoundary = true
        colisao.collisionDelegate = self

        // Adiciona os comportamentos
        self.animator = UIDynamicAnimator(referenceView: self.view)
        self.animator.addBehavior(gravidade)
        self.animator.addBehavior(colisao)
    }

    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
    
        // Início da Colisão: pinta a cor de fundo da imagem de verde, apenas para demonstrar que colidiu
        let view = item as! UIView
        view.backgroundColor = UIColor.green
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, endedContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?) {
        print("Fim da colisão")
    }
}

