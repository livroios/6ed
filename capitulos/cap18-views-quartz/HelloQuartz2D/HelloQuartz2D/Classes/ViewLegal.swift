//
//  ViewLegal.swift
//  HelloQuartz2D
//
//  Created by Ricardo Lecheta on 7/6/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import UIKit
import QuartzCore

class ViewLegal: UIView {
    
    var x: Int = 100
    var y: Int = 100
    
    override init(frame: CGRect) {
        super.init(frame:frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func draw(_ rect: CGRect)  {
        desenhaFundoBranco()
        desenhaLinha()
        desenhaQuadrado()
        desenhaPath()
        desenhaCirculo()
        desenhaImagem()
        
        // Demo touch
        desenhaCirculoTouch()
    }
    
    // Fundo branco
    func desenhaFundoBranco() {
        // Recupera o contexto
        let context = UIGraphicsGetCurrentContext()

        // Branco: Cor de preenchimento
        let color = UIColor.white
        context?.setFillColor(color.cgColor)

        // Quadrado preeenchido
        context?.fill(CGRect(x: 0, y: 0, width:self.frame.size.width, height: self.frame.size.height))
    }
    
    // Linha azul na diagonal
    func desenhaLinha() {
        // Recupera o contexto
        let context = UIGraphicsGetCurrentContext()
        
        context?.setLineWidth(2.0)
        
        // Azul
        let azul = UIColor.blue.cgColor
        
        // Cor da linha
        context?.setStrokeColor(azul)
        
        // Posiciona no 0,0
        context?.move(to: CGPoint(x: 0, y: 0))
        
        // Cria uma linha até o final da tela na diagonal
        //CGContextAddLineToPoint(context, 320, 480)
        context?.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        
        // Desenha a linha
        context?.strokePath()
    }
    
    // Desenha um Quadrado
    func desenhaQuadrado() {
        // Recupera o contexto
        let context = UIGraphicsGetCurrentContext()

        // Azul
        let color = UIColor.blue

        // Cor da linha
        context?.setStrokeColor(color.cgColor)

        // Quadrado
        context?.addRect(CGRect(x:10, y:190, width:100, height:100))

        // Desenha
        context?.strokePath();
    }
    
    // Desenha um Path (caminho)
    func desenhaPath() {
        // Recupera o contexto
        let context = UIGraphicsGetCurrentContext()
        
        // Azul
        let color = UIColor.blue
        
        // Cor da linha
        context?.setStrokeColor(color.cgColor)
        
        // Posiciona o pincel na coordenada 0,0
        context?.move(to: CGPoint(x: 10, y: 10))

        // Linha para baixo
        context?.addLine(to: CGPoint(x: 10, y: 100))

        // Linha para direita
        context?.addLine(to: CGPoint(x: 100, y: 100))

        // Linha para cima
        context?.addLine(to: CGPoint(x: 100, y: 10))

        // Linha para esquerda
        context?.addLine(to: CGPoint(x: 10, y: 10))

        // Cor de preenchimento
        context?.setFillColor(UIColor.red.cgColor)
        context?.fillPath()
        
        // Desenha
        context?.strokePath();
    }
    
    // Desenha um Círculo
    func desenhaCirculo() {
        // Recupera o contexto
        let context = UIGraphicsGetCurrentContext()
        
        // Azul
        let color = UIColor.blue
        context?.setStrokeColor(color.cgColor)
        context?.setFillColor(color.cgColor)

        // Círculo
        let x = self.frame.size.width - 110
        context?.addEllipse(in: CGRect(x:x, y:10, width:100, height:100))
        
        // Desenha
        context?.strokePath()
        
        // Círculo preenchido
        context?.fillEllipse(in: CGRect(x:x, y:120, width:100, height:100))
        
        // Desenha
        context?.strokePath()
    }
    
    // Desenha uma imagem
    func desenhaImagem() {
        let img = UIImage(named: "mclaren.png")!
        
        // Desenha na posição 10/10
//        let point = CGPoint(x:10, y:10)
//        img.drawAtPoint(point)
        
        let imageRect = CGRect(x:10, y:self.frame.size.height - 100, width:200, height:85)
        img.draw(in: imageRect)
    }
    
    // Desenha um Círculo
    func desenhaCirculoTouch() {
        // Recupera o contexto
        let context = UIGraphicsGetCurrentContext()
        
        // Azul
        let color = UIColor.green
        context?.setStrokeColor(color.cgColor)
        context?.setFillColor(color.cgColor)
        
        // Círculo
        context?.fillEllipse(in: CGRect(x:self.x-25, y:self.y-25, width:50, height:50))
        
        // Desenha
        context?.strokePath()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        if let touch = touches.first {
            // Lê a posicão do touch
            let point = touch.location(in: self)
            
            self.x = Int(point.x)
            self.y = Int(point.y)
            
            self.setNeedsDisplay()
        }
        super.touchesBegan(touches , with:event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)  {
        if let touch = touches.first {
            // Lê a posicão do touch
            let point = touch.location(in: self)
            
            self.x = Int(point.x)
            self.y = Int(point.y)
            
            self.setNeedsDisplay()
        }

        super.touchesBegan(touches, with:event)
    }
    
}




































