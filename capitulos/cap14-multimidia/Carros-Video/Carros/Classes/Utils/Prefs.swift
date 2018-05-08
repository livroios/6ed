//
//  Prefs.swift
//  Carros
//
//  Created by Ricardo Lecheta on 6/30/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import Foundation

class Prefs {
    
    class func setString(_ valor: String, chave: String) {
        let prefs = UserDefaults.standard
        prefs.setValue(valor, forKey: chave)
        prefs.synchronize()
    }
    
    class func getString(_ chave: String) -> String? {
        let prefs = UserDefaults.standard
        let s = prefs.string(forKey: chave)
        return s
    }
    
    class func setInt(_ valor: Int, chave: String) {
        let prefs = UserDefaults.standard
        prefs.set(valor, forKey: chave)
        prefs.synchronize()
    }
    
    class func getInt(_ chave: String) -> Int {
        let prefs = UserDefaults.standard
        let s = prefs.integer(forKey: chave)
        return s
    }
}
