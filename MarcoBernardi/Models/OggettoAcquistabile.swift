//
//  oggettoAcquistabile.swift
//  MarcoBernardi
//
//  Created by IED Student on 13/05/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

class OggettoAcquistabile: Comparable {
    
    static func < (lhs: OggettoAcquistabile, rhs: OggettoAcquistabile) -> Bool {
        return (lhs.id ?? 0) < (rhs.id ?? 0)
    }
    
    static func == (lhs: OggettoAcquistabile, rhs: OggettoAcquistabile) -> Bool {
        return lhs.nome == rhs.nome
    }

    var id: Int?
    
    var nome: String?
    
    var quantita: Int?
    
    var prezzo: Double?
    
    var immagineURL: String?
}
