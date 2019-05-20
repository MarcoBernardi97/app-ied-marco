//
//  Evento.swift
//  MarcoBernardi
//
//  Created by IED Student on 08/04/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

class Evento {
    var id : Int?
    
    var nome : String?
    var descrizione : String?
    
    var data : Date?
    var indirizzo : String?
    
    var prezzo : Double?
    
    var copertinaUrl : String?
    
    var oggettiAcquistabili: [OggettoAcquistabile]?
}
