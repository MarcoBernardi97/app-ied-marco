//
//  Database.swift
//  MarcoBernardi
//
//  Created by IED Student on 20/05/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit
import MapKit
class Database {
    
    //Lista di eventi
    static var eventi : [Evento] = []
    
    static func creaEventiDiProva () {
        let eventoUno = Evento()
        eventoUno.nome = "Concertone"
        eventoUno.data = DateUtility.data(conStringa: "08/09/2020 20:30", formato: "dd/MM/yyyy HH:mm")
        eventoUno.indirizzo = "V.le Oceano Atlantico"
        eventoUno.coordinate = CLLocationCoordinate2D.init(latitude: 41.8192529, longitude: 12.4674779)
        eventoUno.prezzo = 30.0
        eventoUno.copertinaUrl = "https://images.unsplash.com/photo-1514525253161-7a46d19cd819?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80"
        eventoUno.descrizione = "L'esibizione inizia alle ore 20.30"
        
        //creo un oggetto acquistabile
        let acquistabileUno = OggettoAcquistabile()
        acquistabileUno.nome = "Ticket Gold"
        acquistabileUno.quantita = 30
        acquistabileUno.prezzo = 89.90
        acquistabileUno.immagineURL = "https://images.unsplash.com/photo-1475527588268-e6a157656e35?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80"
        
        let acquistabileDue = OggettoAcquistabile()
        acquistabileDue.nome = "Ticket Silver"
        acquistabileDue.quantita = 50
        acquistabileDue.prezzo = 50.00
        acquistabileDue.immagineURL = "https://images.unsplash.com/photo-1507638136177-1e4d9d20bd31?ixlib=rb-1.2.1&auto=format&fit=crop&w=1362&q=80"
        
        //lo aggiungo alla lista di oggetti acquistabili del primo evento
        eventoUno.oggettiAcquistabili = [acquistabileUno, acquistabileDue ]
        
        eventi.append(eventoUno)
        
        let due = Evento()
        due.nome = "Lezione app design"
        due.data = Date()
        due.indirizzo = "Via Alcamo 11"
        due.coordinate = CLLocationCoordinate2D.init(latitude: 41.8887741, longitude: 12.524077799999999)
        due.prezzo = 55.0
        due.copertinaUrl = "https://images.unsplash.com/photo-1514525253161-7a46d19cd819?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80"
        due.descrizione = "La lezione è dalle 15.00 alle 18.00"
        
      
        
        
        
        eventi.append(due)
        
        let tre = Evento()
        tre.nome = "Lezione app design"
        tre.data = Date()
        tre.indirizzo = "Duomo di Milano"
        tre.coordinate = CLLocationCoordinate2D.init(latitude: 45.4640658, longitude: 9.1906621)
        tre.prezzo = 55.0
        tre.copertinaUrl = "https://images.unsplash.com/photo-1514525253161-7a46d19cd819?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80"
        tre.descrizione = "La lezione è dalle 15.00 alle 18.00"
        
        
        eventi.append(tre)
    }
}
