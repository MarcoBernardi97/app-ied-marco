//
//  PinMappa.swift
//  MarcoBernardi
//
//  Created by IED Student on 20/05/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit
import MapKit

//oggetto creato per poter aggiungere i pin sulla mapView
class PinMappa: NSObject, MKAnnotation {
    
    //variabili richieste dal protocollo MKAnnotation
    var title: String?
    var subtitle: String?
    var coordinate = CLLocationCoordinate2D()
    
    convenience init(conEvento evento: Evento) {
        self.init()
        
        //copio i dati dell'evento sui dati del pin
        title = evento.nome
        subtitle = evento.indirizzo
        
        if let coordinateEvento = evento.coordinate{
            coordinate = coordinateEvento
        }
    }

}
