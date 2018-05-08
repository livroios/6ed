//
//  ViewController.swift
//  HelloClosures
//
//  Created by Ricardo Lecheta on 7/6/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var btn: UIButton!
    
/**
    Closures
    
    { (Parameters) -> Return in
        statements
    }
    
**/
  
    @IBAction func exemploSimples() {
        let imprimeData = { () -> Void in
            let date = NSDate()
            print("Data: \(date)")
        }
        imprimeData()
        
       
    }

    @IBAction func exemploSimplesParametros() {
        let soma = { (a:Int, b:Int) -> Int in
            return a + b
        }
        let resultado = soma(3,4)
        print("Soma: \(resultado)")
    }

    @IBAction func exemploFuncao() {
        let soma = { (a:Int, b:Int) -> Int in
            return a + b
        }
        self.metodoQueRecebeBlocoComoParametro(soma)
    }
    // Método que recebe um bloco como argumento
    func metodoQueRecebeBlocoComoParametro(_ soma: (_ a:Int, _ b:Int) -> Int) {
        let resultado = soma(3,4)
        print("Soma passada por função: \(resultado)")
    }


    @IBAction func exemploAnimacao() {
        UIView.animate(withDuration: 1, delay:0, options: UIViewAnimationOptions(),
            animations: {
                if(self.btn.alpha == 0) {
                    self.btn.alpha = 1
                } else {
                    self.btn.alpha = 0
                }
            }, completion: {
                (Bool) -> Void in
                    print("Fim")
                }
        )
    }
    
    @IBAction func exemploFuncao2() {

        self.testeCall()
    }
    
    
    // Método que recebe um bloco como argumento
    func teste(_ callback: (_ carros:Array<String>) -> Void) {
        callback(["1","2"])
    }

    func testeCall() {
        teste(
            {
                (carros: Array<String>) in
                
                print(carros)
            }
        )
    }

}

