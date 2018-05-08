//
//  ViewController.swift
//  HelloAnimacao
//
//  Created by Ricardo Lecheta on 7/6/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet var img: UIImageView!
    @IBOutlet var picker: UIPickerView!

    var array: Array<String> = ["Alpha","Mover","Mover - Transform","Redimensionar","Redimensionar - Transform",
        "Girar 1 - Transform", "Demo Closure 1", "Demo Closure 2"]

    override func viewDidLoad() {
        super.viewDidLoad()

        picker.delegate = self
        
        let rect = img.frame as CGRect
        let x = rect.origin.x  // Coordenada x
        let y = rect.origin.y  // Coordenada y
        let w = rect.size.width // Largura
        let h = rect.size.height  // Altura

        print("x/y = \(x)/\(y), w/h:\(w)/\(h)")

        print("rect \(rect)")
        print("rect \(NSStringFromCGRect(rect))")
        
//        let rect2 = CGRect(x: 126, y: 20, width: 69, height: 77)
//        println("rect2 \(rect2)")

        print("frame \(img.frame), bound \(img.bounds)")
    }

    @IBAction func animar() {
        // Texto selecionado do picker
        let idx = picker.selectedRow(inComponent: 0)
        let s = self.array[idx]
        
        print(s)
        
        switch s {
            case "Alpha":
                self.alpha()
            case "Mover":
                self.mover1()
            case "Mover - Transform":
                self.mover2()
            case "Redimensionar":
                self.redimensionar1()
            case "Redimensionar - Transform":
                self.redimensionar2()
            case "Girar 1 - Transform":
                self.girar1()
            case "Demo Closure 1":
                self.demoClosure1()
            case "Demo Closure 2":
                self.demoClosure2()
            default:
                print("Animação não conhecida")
        }
    }
    
    func alpha() {
        UIView.beginAnimations(nil, context: nil)
        
        // Durante 3 segundos
        UIView.setAnimationDuration(1)
        
        // Informa o delegate para monitorar a animação
        UIView.setAnimationDelegate(self)
        UIView.setAnimationWillStart(#selector(startAnimation))
        UIView.setAnimationDidStop(#selector(stopAnimation))
        
        if (img.alpha == 1) {
            // Está visível, deixa transparente
            img.alpha = 0
        } else {
            // Está transparente, deixa visível
            img.alpha = 1
        }

        // Finaliza a animação
        UIView.commitAnimations()
    }
    
    func mover1() {
        UIView.beginAnimations(nil, context: nil)
        
        // Durante 3 segundos
        UIView.setAnimationDuration(1)
        
        // x original conforme a imagem foi inserida no xib
        let xOriginal = 126 as CGFloat
    
        let x = img.frame.origin.x
        let y = img.frame.origin.y
        let w = img.frame.size.width
        let h = img.frame.size.height

        // Se está na posição original
            
        // Finaliza a animação
        if (x == xOriginal) {
            // Mover para a direita
            img.frame = CGRect(x: x + 100, y:y, width:w, height:h)
        } else {
            // Mover de volta para esquerda (x original)
            img.frame = CGRect(x: x - 100, y:y, width:w, height:h)
        }

        // Finaliza a animação
        UIView.commitAnimations()
    }
    
    func mover2() {
        UIView.beginAnimations(nil, context: nil)
        
        // Durante 3 segundos
        UIView.setAnimationDuration(1)

        // Deslocamento atual do eixo x
        let tx = img.transform.tx
        if (tx == 0) {
            // Mover para a direita
            img.transform = CGAffineTransform(translationX: 100,y: 0)
        } else {
            // Zera a transformação
            img.transform = CGAffineTransform.identity
        }
        
        // Finaliza a animação
        UIView.commitAnimations()
    }
    
    func redimensionar1() {
        UIView.beginAnimations(nil, context: nil)
        
        // Durante 3 segundos
        UIView.setAnimationDuration(1)

        let x = img.frame.origin.x
        let y = img.frame.origin.y
        let w = img.frame.size.width
        let h = img.frame.size.height
        
        // Tamanho original
        if (img.bounds.size.width == 69) {
            // Redimensiona a imagem para ficar com o dobro do tamanho
            img.bounds = CGRect(x: x, y:y, width:w*2, height:h*2)
        } else {
            // Volta o tamanho original da imagem
            img.bounds = CGRect(x: x, y:y, width:69, height:77)
        }
        
        // Finaliza a animação
        UIView.commitAnimations()
    }
    
    func redimensionar2() {
        UIView.beginAnimations(nil, context: nil)
        
        // Durante 3 segundos
        UIView.setAnimationDuration(1)
        
        // Deslocamento atual do eixo Y
        let ty = img.transform.a
        if (ty == 1) {
            // Se está no tamanho original (100%), vamos aumentar a imagem para 200%
            img.transform = CGAffineTransform(scaleX: 2,y: 2)
        } else {
            // Apaga a transformação
            img.transform = CGAffineTransform.identity
        }
        
        // Finaliza a animação
        UIView.commitAnimations()
    }
    
    func girar1() {
        UIView.beginAnimations(nil, context: nil)
        
        // Durante 3 segundos
        UIView.setAnimationDuration(1)
        
        // Valor atual da transformação (propriedade d da matriz)
        let d = img.transform.d
        if (d == 1) {
            // Se está na posição original, vamos girar 180º
            img.transform = CGAffineTransform(rotationAngle: degreesToRadians(180))
        } else {
            // Apaga a transformação
            img.transform = CGAffineTransform.identity
        }
        
        // Finaliza a animação
        UIView.commitAnimations()
    }
    
    func demoClosure1() {
        UIView.animate(withDuration: 1, delay:0, options: UIViewAnimationOptions(),
            animations: {
                
                // Deslocamento atual do eixo x
                let tx = self.img.transform.tx
                if (tx == 0) {
                    // Mover para a direita
                    self.img.transform = CGAffineTransform(translationX: 100,y: 0)
                } else {
                    // Zera a transformação
                    self.img.transform = CGAffineTransform.identity
                }

            }, completion: nil)
    }
    
    func demoClosure2() {
        
        UIView.animate(withDuration: 1, delay:0, options: UIViewAnimationOptions(),
            animations: {
                
                // Girar 180º
                let d = self.img.transform.d
                if (d == 1) {
                    // Se está na posição original, vamos girar 180º
                    self.img.transform = CGAffineTransform(rotationAngle: self.degreesToRadians(180))
                } else {
                    // Apaga a transformação
                    self.img.transform = CGAffineTransform.identity
                }
                
            }, completion: {
                (Bool) -> Void in
                
                // Esconde ou Mostra
                if(self.img.alpha == 0) {
                    self.img.alpha = 1
                } else {
                    self.img.alpha = 0
                }
            })
    }
    
    func degreesToRadians(_ degrees: Double) -> CGFloat {
        let radians = CGFloat(Double(Double.pi) * degrees / 180.0)
        return radians
    }

    @objc func startAnimation() {
        print("Start Animation")
    }
    
    @objc func stopAnimation() {
        print("Stop Animation")
    }
}

// UIPickerViewDataSource
extension ViewController {
    
    // returns the number of 'columns' to display.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // Retorna o número de colunas que será exibido
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // Retorna o número de linhas que será exibido
        return self.array.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // Retorna o texto que é exibido para o índice fornecido
        return self.array[row]
    }
    
}

