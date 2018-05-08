//
//  ViewController.swift
//  HelloIBooks
//
//  Created by Ricardo Lecheta on 7/5/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIDocumentInteractionControllerDelegate {
    
    @IBAction func visualizarFigura() {
        
        // Pré-visualização da figura
        
        let path = Bundle.main.path(forResource: "mclaren.png", ofType: nil)
        
        let url = URL(fileURLWithPath: path!)
        
        // Cria o DocumentInteractionController informando a URL
        
        let docController = UIDocumentInteractionController(url:url)
        
        docController.delegate = self
        
        docController.presentPreview(animated: true)
        
    }
    
    @IBAction func visualizarPDF() {
        
        // PDF para abrir
        
        let path = Bundle.main.path(forResource: "sumario_livro_ios.pdf", ofType: nil)
        
        let url = URL(fileURLWithPath: path!)
        
        // Cria o DocumentInteractionController informando a URL
        
        let docController = UIDocumentInteractionController(url:url)
        
        docController.delegate = self
        
        docController.presentPreview(animated: true)
        
    }
    
    @IBAction func abrirIBooks() {
        
        // PDF para abrir
        
        let path = Bundle.main.path(forResource: "sumario_livro_ios.pdf", ofType: nil)
        
        let url = URL(fileURLWithPath: path!)
        
        // Abre o arquivo pdf no iBooks se estiver instalado no device
        
        let iBooksInstalled = UIApplication.shared.canOpenURL(url)
        
        if(iBooksInstalled) {
            
            print("iBooksInstalled: \(iBooksInstalled)")
            
            // Cria o DocumentInteractionController informando a URL
            
            let docController = UIDocumentInteractionController(url:url)
            
            docController.delegate = self
            
            docController.presentOpenInMenu(from: CGRect.zero, in:self.view, animated: true)
            
        } else {
            print("iBooks não está instalado.")
        }
    }
    
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        
        return self
        
    }
    
}

