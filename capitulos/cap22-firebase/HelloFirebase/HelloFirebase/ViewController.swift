//
//  ViewController.swift
//  HelloFirebase
//
//  Created by Ricardo Lecheta on 06/05/18.
//  Copyright © 2018 Ricardo Lecheta. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController {
    @IBOutlet var label: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        showToken()
    }
    @IBAction func onClickShowToken(_ sender: UIButton) {
        showToken()
    }
    func showToken() {
        let token = Messaging.messaging().fcmToken
        if let token = token {
            print("FCM token: \(token)")
            label.text = token
        }
    }
}

