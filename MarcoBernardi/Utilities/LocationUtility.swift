//
//  LocationUtility.swift
//  MarcoBernardi
//
//  Created by IED Student on 27/05/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit
import MapKit

class LocationUtility {
    
    static func distanza(da: CLLocationCoordinate2D?, a: CLLocationCoordinate2D?) -> CLLocationDistance? {
        //controllo che i dati passati siano validi
        guard let da = da, let a = a else{
            return nil
        }
        guard CLLocationCoordinate2DIsValid(da), CLLocationCoordinate2DIsValid(a) else {
            return nil
        }
        guard da.latitude != 0.0, da.longitude != 0.0, a.latitude != 0.0, a.longitude != 0.0 else {
            return nil
        }
        
        let locationDa = CLLocation(latitude: da.latitude, longitude: da.longitude)
        let locationA = CLLocation(latitude: a.latitude, longitude: a.longitude)
        
        return locationDa.distance(from: locationA)
    }
    
    static func navigaVerso(evento: Evento?) {
        
        guard let coordinate = evento?.coordinate, controlloCordinate(coordinate) else {
            return
        }
        
        let placemark = MKPlacemark(coordinate:coordinate)
        let item = MKMapItem(placemark : placemark)
        
        item.name = evento?.nome
        
        item.openInMaps(launchOptions: nil)
    }
    
    static func controlloCordinate(_ coordinate: CLLocationCoordinate2D?) -> Bool {
        guard let coordinate = coordinate else {
            return false
        }
        guard CLLocationCoordinate2DIsValid(coordinate) else {
            return false
        }
        guard coordinate.latitude != 0.0, coordinate.longitude != 0.0 else {
            return false
        }
        return true
    }

}
