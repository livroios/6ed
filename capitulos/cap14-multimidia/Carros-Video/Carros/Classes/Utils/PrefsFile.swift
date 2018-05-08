//
//  PrefsFile.swift
//  Carros
//
//  Created by Ricardo Lecheta on 7/1/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import Foundation

class PrefsFile : Prefs {
    
    class func getFilePath(_ nome: String) -> String {
        // Caminho com o arquivo
        let path = NSHomeDirectory() + "/Documents/" + nome + ".txt"
        print(path)
        return path
    }

    override class func setString(_ valor: String, chave: String) {
        // Caminho com o arquivo
        let path = PrefsFile.getFilePath(chave)
        let nsdata = StringUtils.toNSData(valor)
//        var s = StringUtils.toString(nsdata)
        // Escreve o NSData para arquivo
        try? nsdata.write(to: URL(fileURLWithPath: path), options: [.atomic])
    }

    override class func getString(_ chave: String) -> String! {
        // Caminho com o arquivo
        let path = PrefsFile.getFilePath(chave)
        let nsdata = try? Data(contentsOf: URL(fileURLWithPath: path))
        let valor = StringUtils.toString(nsdata)
        return valor
    }
    
    override class func setInt(_ valor: Int, chave: String) {
        // Converte Int para String e delega para o outro método
        setString(String(valor), chave: chave)
    }
    
    override class func getInt(_ chave: String) -> Int {
        let valorString: String! = getString(chave)
        if(valorString != nil) {
            // Não existe
            return 0
        }
        let valorInt = Int(valorString)
        return valorInt!
    }
}
