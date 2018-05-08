//
//  GpsMapViewController.swift
//  Carros
//
//  Created by Ricardo Lecheta on 7/27/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import UIKit
import MapKit

// Herda do MapViewController então usa o MapViewController.xib
class GpsMapViewController: MapViewController, CLLocationManagerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Solicitar a permissão do usuário
        self.locationManager.requestWhenInUseAuthorization()
    }

    override func viewDidAppear(_ animated: Bool)  {
        super.viewDidAppear(animated)
        
        // Inicia o LocationManager para monitora as coordenadas GPS
        self.locationManager.delegate = self
        self.locationManager.distanceFilter = 100.00
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        
        // Começa a monitorar o GPS
        self.locationManager.startUpdatingLocation()
    }
    
    override func viewDidDisappear(_ animated: Bool)  {
        super.viewDidDisappear(animated)
        // Desliga o monitoramento do GPS
        self.locationManager.stopUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Última localização CLLocation
        let newLocation = locations[locations.count-1] as CLLocation

        let lat = newLocation.coordinate.latitude
        let lng = newLocation.coordinate.longitude
        
        print("didUpdateToLocation lat:\(lat), lng:\(lng)")
        
//        let distancia = newLocation.distanceFromLocation(oldLocation)
//        println("Distância em metros:\(distancia)")
        
        // Coordenada (latitude/longitude)
        let center = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        print(center)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let location = MKCoordinateRegion(center: center, span: span)
        
        // Centraliza o mapa nesta coordenada
        self.mapView.setRegion(location, animated: true)
        
        // Atualiza o marcador para acompanhar o GPS
        self.pin.coordinate = center
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("locationManager.didFailWithError: \(error)")
    }
    
    func exibirRota() {
        let url = "https://maps.google.com/maps?saddr=-22.967482,-43.178802&daddr=-22.951915,-43.21056"
        
        UIApplication.shared.openURL(URL(string:url)!)
    }


}
