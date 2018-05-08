//
//  XMLCarroParser.swift
//  Carros
//
//  Created by Ricardo Lecheta on 6/29/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import Foundation

class XMLCarroParser :NSObject, XMLParserDelegate {
    
    // Lista de carros
    var carros : Array<Carro> = []
    
    // Variáveis auxiliares para o parser
    var tempString: String = ""
    
    var carro: Carro?
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        if("carro" == elementName) {
            // Tag <carro> encontrada, cria um novo objeto carro
            carro = CarroDBCoreData.newInstance()
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if("carros" == elementName) {
            // Tag de fim </carros> encontrada. Significa que terminou o XML.
            return
        }
        
        if("carro" == elementName) {
            // Insere o carro no array e limpa o objeto
            self.carros.append(carro!)
            carro = nil
            return
        }
        
        // Se não é a tag <carro>, pode ser as tags <nome>, <desc> etc.
        // Copia os valores do XML para o objeto carro
        // Se existirem tags com o mesmo nome da @property do Carro, o valor será copiado
        if(carro != nil) {
            
            //println("tempString [\(tempString)]")
            
            // Copia os atributos do carro
            if("nome" == elementName) {
                carro!.nome = tempString
            } else if("desc" == elementName) {
                carro!.desc = tempString
            } else if("url_foto" == elementName) {
                carro!.url_foto = tempString
            }  else if("url_info" == elementName) {
                carro!.url_info = tempString
            } else if("url_video" == elementName) {
                carro!.url_video = tempString
            } else if("latitude" == elementName) {
                carro!.latitude = tempString
            } else if("longitude" == elementName) {
                carro!.longitude = tempString
            }
            tempString = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        // Remove \n\t do arquivo.
        var s = string.replace("\n", with: "")
        s = s.replace("\t", with: "")
        s = s.trim()
        // Faz append da string.
        tempString += s
    }
    
}
