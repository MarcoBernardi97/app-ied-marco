//
//  MappaController.swift
//  MarcoBernardi
//
//  Created by IED Student on 20/05/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit
import MapKit


class MappaController: UIViewController {
    
    //classe che gestisce le informazioni sulla posizione dell'utente
    let manager = CLLocationManager()
    
    // MARK: - Outlets
    
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: - Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //imposto il nome della pagina
        navigationItem.title = "Mappa Eventi"
        
        //chiedo la posizione dell'utente al sistema operativo
        manager.requestWhenInUseAuthorization()
        
        //mostro la mia posizione sulla mappa
        mapView.showsUserLocation = true
        
        //aggiungo i pin sulla mappa
        for evento in Database.eventi {
            //creo pin
            let pin = PinMappa.init(conEvento: evento)
            
            //lo aggiungo sulla mappa
            mapView.addAnnotation(pin)
        }
        
        
    }

    
}
