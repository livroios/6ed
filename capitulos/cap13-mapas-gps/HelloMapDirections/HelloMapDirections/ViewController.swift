//
//  ViewController.swift
//  HelloMapDirections
//
//  Created by Ricardo Lecheta on 7/5/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet var textEndereco: UITextField!
    
    init() {
        super.init(nibName: "ViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textEndereco.text = "Av Manoel Ribas, Mercês Curitiba Brasil"
    }
    
    // Método chamado para fazer o geocoding
    @IBAction func go() {
        
        let geoCoder = CLGeocoder()
        let endereco = textEndereco.text!

        geoCoder.geocodeAddressString(endereco) { (placemarks, error) -> Void in
            
            if let placemark = placemarks?[0] {
                
                print("Placemark \(placemark)")
                
                // Recupera a primeira localização
                let location = placemark.location!
                
                print("Location \(location)")
                
                let lat = location.coordinate.latitude
                let lng = location.coordinate.longitude
                
                print("Lat: \(lat) / Lng: \(lng)")
                
                // Abre o mapa nesta localização
                let url = "https://maps.google.com/maps?saddr=\(lat),\(lng)"
                
                UIApplication.shared.openURL(URL(string:url)!)
                
                print("URL \(url)")
            }
        }
    }
    
    // Método chamado para fazer o geocoding
    @IBAction func go2() {
        
        print("go2()")
        
        let geoCoder = CLGeocoder()
        let endereco = textEndereco.text!
        
        print("Endereço \(endereco)")
        
        // Ou chamando assim declarando a função callback
        let callback = { (placemarks: [CLPlacemark]?, error: NSError?) -> Void in
            
            if let placemark = placemarks?[0] {
                
                print("Placemark \(placemark)")
                
                // Recupera a primeira localização
                let location = placemark.location!
                
                print("Location \(location)")
                
                let lat = location.coordinate.latitude
                let lng = location.coordinate.longitude
                
                print("Lat: \(lat) / Lng: \(lng)")
                
                // Abre o mapa
                let url = "https://maps.google.com/maps?saddr=\(lat),\(lng)"
                
                UIApplication.shared.openURL(URL(string:url)!)
                
                print("URL \(url)")
            }
        }
        
        geoCoder.geocodeAddressString(endereco, completionHandler:callback as! CLGeocodeCompletionHandler)
    }
}

