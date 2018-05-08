//
//  Alerta.swift
//  Carros
//
//  Created by Ricardo Lecheta on 7/12/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import UIKit

class Alerta {
    
    class func alerta(_ msg : String, viewController: UIViewController) {
        
        Alerta.alerta(msg, viewController: viewController, action: nil)
    }

    class func alerta(_ msg : String, viewController: UIViewController,action: ((UIAlertAction?) -> Void)!) {
        
        let alert = UIAlertController(title: "Alerta", message: msg, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: action))
        
        viewController.present(alert, animated: true, completion: nil)
    }
    
}
