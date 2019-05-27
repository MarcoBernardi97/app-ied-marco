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

}
