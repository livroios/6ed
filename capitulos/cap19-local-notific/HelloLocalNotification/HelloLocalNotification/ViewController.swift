//
//  ViewController.swift
//  HelloLocalNotification
//
//  Created by Ricardo Lecheta on 7/6/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    

    @IBAction func addLocalNotification() {
    
        print("addLocalNotification")
      
        LocalNotificUtil.addLocalNotification("Teste de Mensagem","Ação aqui",2)
        
    }
    
    


}

