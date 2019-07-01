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
        eventoUno.nome = "Concerto Avicii"
        eventoUno.data = DateUtility.data(conStringa: "08/09/2020 20:30", formato: "dd/MM/yyyy HH:mm")
        eventoUno.indirizzo = "V.le Oceano Atlantico"
        eventoUno.coordinate = CLLocationCoordinate2D.init(latitude: 41.6340992, longitude: 12.4987313)
        eventoUno.prezzo = 45.0
        eventoUno.immagineURL = "https://cdn.wegow.com/media/artists/avicii/avicii-1496218027.41.2560x1440.jpg"
        eventoUno.descrizione = "L'esibizione inizia alle ore 20.30"
        
        //creo un oggetto acquistabile
        let acquistabileUno = OggettoAcquistabile()
        acquistabileUno.nome = "Pista"
        acquistabileUno.quantita = 400
        acquistabileUno.prezzo = 50.00
        acquistabileUno.immagineURL = "https://www.lastampa.it/rf/image_lowres/Pub/p4/2019/04/15/Cronaca/Foto/RitagliWeb/ac9f5500-5f87-11e9-b8e0-4dedb7c00f9c_queever-krgF-U11202961477344zVG-1024x576%40LaStampa.it.jpg"
        
        let acquistabileDue = OggettoAcquistabile()
        acquistabileDue.nome = "Posti rialzati"
        acquistabileDue.quantita = 200
        acquistabileDue.prezzo = 89.90
        acquistabileDue.immagineURL = "https://images.unsplash.com/photo-1475527588268-e6a157656e35?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80"
        //lo aggiungo alla lista di oggetti acquistabili del primo evento"
        
        eventoUno.oggettiAcquistabili = [acquistabileUno, acquistabileDue ]
        
        eventi.append(eventoUno)
        
        let eventoDue = Evento()
        eventoDue.nome = "Partita del cuore"
        eventoDue.data = Date()
        eventoDue.indirizzo = "Stadio Olimpico di Roma"
        eventoDue.coordinate = CLLocationCoordinate2D.init(latitude: 41.9339521, longitude: 12.4547231)
        eventoDue.prezzo = 15.0
        eventoDue.immagineURL = "http://www.sanfrancescocalcio.it/wp-content/uploads/2017/09/campnou.jpg"
        eventoDue.descrizione = "L'inizio della partita è previsto alle 20:45. Al termine i giocatori faranno un giro di campo per ringraziare gli spettatori"
        
        //creo un oggetto acquistabile
        let acquistabileTre = OggettoAcquistabile()
        acquistabileTre.nome = "Curve"
        acquistabileTre.quantita = 10000
        acquistabileTre.prezzo = 10.00
        acquistabileTre.immagineURL = "http://www.goldelnapoli.it/2013/wp-content/uploads/2018/08/palco.jpg"
        
        let acquistabileQuattro = OggettoAcquistabile()
        acquistabileQuattro.nome = "Tribuna Tevere"
        acquistabileQuattro.quantita = 15000
        acquistabileQuattro.prezzo = 30.00
        acquistabileQuattro.immagineURL = "https://www.insideroma.com/images/tribuna_montemario.jpg"
        
        let acquistabileCinque = OggettoAcquistabile()
        acquistabileCinque.nome = "Tribuna Montemario"
        acquistabileCinque.quantita = 12500
        acquistabileCinque.prezzo = 40.00
        acquistabileCinque.immagineURL = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWdgkF1a1f79j06Z6rmet0vBnK1Wd-aHvpjYz9KlP38NrwI9BA"
        
        //lo aggiungo alla lista di oggetti acquistabili del primo evento
        eventoDue.oggettiAcquistabili = [acquistabileTre, acquistabileQuattro, acquistabileCinque ]
      
        eventi.append(eventoDue)
        
        let eventoTre = Evento()
        eventoTre.nome = "Harley Davidson Reunion"
        eventoTre.data = Date()
        eventoTre.indirizzo = "Lido di Ostia"
        eventoTre.coordinate = CLLocationCoordinate2D.init(latitude: 41.7325672, longitude: 12.2787587)
        eventoTre.prezzo = 30.0
        eventoTre.immagineURL = "http://static.nextmoto.it/625X0/www/nextmoto/it/img/HarleyDavidson_OnTheRoad.jpg"
        eventoTre.descrizione = "Appuntamento alle 9:00 al pontile di Ostia. Dopo una passeggiata sul lungomare è previsto un pranzo al sacco per chi lo desidera."
        
        let acquistabileSei = OggettoAcquistabile()
        acquistabileSei.nome = "Partecipazione all'evento"
        acquistabileSei.quantita = 200
        acquistabileSei.prezzo = 25.00
        acquistabileSei.immagineURL = "https://static2-viaggi.corriereobjects.it/wp-content/uploads/2013/12/harley-roma-01.jpg"
        
        eventoTre.oggettiAcquistabili = [acquistabileSei]
        
        
        eventi.append(eventoTre)
    }
}
