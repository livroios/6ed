//
//  ViewController.swift
//  HelloCamera
//
//  Created by Ricardo Lecheta on 7/5/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate,
UIImagePickerControllerDelegate {
    
    @IBOutlet var btnCamera : UIButton!
    @IBOutlet var imageView : UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    init() {
        super.init(nibName: "ViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imagePicker.delegate = self
        
        let isCameraDisponivel = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)
        if(!isCameraDisponivel) {
            // Esconde o botão da câmera
            self.btnCamera.isHidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func escolherFoto () {
        print("escolherFoto")
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(imagePicker, animated:true, completion: nil)
    }
    
    @IBAction func tirarFoto () {
        print("tirarFoto")
        imagePicker.sourceType = UIImagePickerControllerSourceType.camera
        self.present(imagePicker, animated:true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("didFinishPickingMediaWithInfo")
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.imageView.image = image
        self.imagePicker.dismiss(animated: true, completion:nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("imagePickerControllerDidCancel")
        self.imagePicker.dismiss(animated: true, completion:nil)
    }
}

