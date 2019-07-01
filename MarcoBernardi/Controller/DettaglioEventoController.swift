//
//  DettaglioEventoController.swift
//  MarcoBernardi
//
//  Created by IED Student on 06/05/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit
import MapKit

class DettaglioEventoController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var evento: Evento?
    var miaPosizione: CLLocation?
    
    //MARK: - Outlets
    
    @IBOutlet weak var imageCopertina: UIImageView!
    
    @IBOutlet weak var labelNome: UILabel!
    
    @IBOutlet weak var labelIndirizzo: UILabel!
    
    @IBOutlet weak var labelDescrizione: UILabel!
    
    @IBOutlet weak var labelPrezzo: UILabel!
    
    @IBOutlet weak var labelData: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var labelDistanza: UILabel!
    
    @IBOutlet weak var labelMeteo: UILabel!
    
    @IBOutlet weak var buttonCarrello: UIButton!
    
    @IBOutlet weak var mappaEvento: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Metto i contenuti dell'evento sui componenti della schermata
        if let eventoDaRappresentare = evento{
            setupConEvento(eventoDaRappresentare)
        }
        
        //Questo serve per comunicare con la CollectionView
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    func setupConEvento(_ evento: Evento) {
        
        labelNome.text = evento.nome
        
        labelIndirizzo.text = evento.indirizzo
        
        NetworkUtility.downloadImmagine(indirizzoWeb: evento.immagineURL, perImageView: imageCopertina)
        
        labelDescrizione.text = evento.descrizione
        
        labelData.text = DateUtility.stringa(conData: evento.data, formato: "dd/MM/yyyy HH:mm")
        
        //calcolo il prezzo
        if let prezzo = evento.prezzo, prezzo > 0.0
        {
            labelPrezzo.text = String(format: "da %.2f €", prezzo)
        }
        else
        {
            labelPrezzo.text = "Gratis"
        }
        
        //calcolo la distanza tra evento e utente
        if let distanza = LocationUtility.distanza(da: evento.coordinate, a: miaPosizione?.coordinate)
        {
            let distanzaInChilometri = distanza / 1000.0
            let stringaDistanza = String.init(format: "%.1f", distanzaInChilometri)
            
            labelDistanza.text = "L'evento è a \(stringaDistanza) km da te!"
            labelDistanza.isHidden = false
        }
        else
        {
            labelDistanza.isHidden = true
        }
        labelMeteo.text = "Caricamento meteo in corso..."
        Network.richiestaMeteoEvento(evento) {
            //questo codice viene eseguito solo quando viene ricevuto il meteo dal server
            (meteo) in
            if let temperatura = meteo?.temperatura{
                if let descrizione = meteo?.descrizione{
                    self.labelMeteo.text = ("La temperatura è di \(temperatura)°C, \(descrizione).")
                }
            }
        }
        
        //creo il pin
        let pin = PinMappa.init(conEvento : evento)
        
        //lo aggiungo alla mappa
        mappaEvento.addAnnotation(pin)
        
        if let coordinate = evento.coordinate {
            let camera = mappaEvento.camera
            camera.centerCoordinate = coordinate
            camera.altitude = 500
        }
        mappaEvento.showsUserLocation = true
        
    }
    
    //MARK: - CollctionView delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //il numero di celle che deve disegnare il collection view
        return evento?.oggettiAcquistabili?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cella = collectionView.dequeueReusableCell(withReuseIdentifier: "CellOggettoAcquistabile", for: indexPath) as! CellOggettoAcquistabile
        
        //Prendo l'oggetto dell'array di acquistabili dell'evento
        let oggetto = evento?.oggettiAcquistabili?[indexPath.item]
        
        //Lo passo alla cella
        cella.setupConOggettoAcquistabile(oggetto)
        return cella
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //Prendo l'oggetto dagli oggetti acquistabili
        guard let oggetto = evento?.oggettiAcquistabili?[indexPath.item] else {
            return
        }
        
        chiediConfermaAcquisto(oggetto: oggetto)
        
    }
    
    func chiediConfermaAcquisto(oggetto: OggettoAcquistabile?){
        //Prendo l'oggetto dagli oggetti acquistabili
        guard let oggetto = oggetto else {
            return
        }
        
        //1.Mostriamo l'alert di conferma
        AlertUtility.mostraAlertDiConferma(conTitolo: "Vuoi aggiungere l'evento al carrello?", messaggio: oggetto.nome, viewController: self) { (sceltaUtente) in
            if sceltaUtente{
                //L'utente ha scelto si
                //Locationutility.navigaVerso(evento: self.evento)
                CartUtility.aggiungiAlCarrello(oggetto)
            }
        }
    }
    //MARK: - CollectionView layout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //altezza pari a tutta l'altezza della collection view
        let altezza = collectionView.frame.size.height
        //larghezza pari ai 2/3 del totale della collection view
        let larghezzaTotale = collectionView.frame.size.width
        let larghezza = larghezzaTotale * 0.7
        
        return CGSize(width: larghezza, height: altezza)
    }
    
    @IBAction func aggiungiAlCarrello(_ sender: Any){
        chiediConfermaAcquisto(oggetto: evento)
    }
    
    @IBAction func navigaVerso(_ sender: Any) {
        AlertUtility.mostraAlertDiConferma(conTitolo: "Vuoi avere le indicazione per arrrivare all'evento?", messaggio: evento?.indirizzo, viewController: self) { (sceltaUtente) in
            if sceltaUtente {
                LocationUtility.navigaVerso(evento: self.evento)
            }
        }
    }
    
    
}

