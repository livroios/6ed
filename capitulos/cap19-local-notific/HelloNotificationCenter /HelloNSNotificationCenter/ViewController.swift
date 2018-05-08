//
//  ViewController.swift
//  HelloNSNotificationCenter
//
//  Created by Ricardo Lecheta on 7/6/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Se registra para receber mensagens do tipo MINHA_NOTIFICACAO
    
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.recebeNotification), name: NSNotification.Name(rawValue: "MINHA_NOTIFICACAO"), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self,name: NSNotification.Name(rawValue: "MINHA_NOTIFICACAO"), object: nil)
    }

    @objc func recebeNotification(notification: Notification) {
        print(">> recebeNotification \(String(describing: notification.object))")
    }

    
    @IBAction func onTouchEnviarNotificacao() {
        // Teste de Notification
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: "MINHA_NOTIFICACAO"), object:"Ricardo")
    }
}

