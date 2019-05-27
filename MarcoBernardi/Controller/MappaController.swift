//
//  MappaController.swift
//  MarcoBernardi
//
//  Created by IED Student on 20/05/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit
import MapKit


class MappaController: UIViewController, MKMapViewDelegate {
    
    //classe che gestisce le informazioni sulla posizione dell'utente
    let manager = CLLocationManager()
    
    // MARK: - Outlets
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var buttonCentraPosizioneUtente: UIButton!
    
    // MARK: - Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //imposto il nome della pagina
        navigationItem.title = "Mappa Eventi"
        
        //chiedo la posizione dell'utente al sistema operativo
        manager.requestWhenInUseAuthorization()
        
        //mostro la mia posizione sulla mappa
        mapView.showsUserLocation = true
        
        //divento delegate della map view
        mapView.delegate = self
        
        //aggiungo i pin sulla mappa
        for evento in Database.eventi {
            //creo pin
            let pin = PinMappa.init(conEvento: evento)
            
            //lo aggiungo sulla mappa
            mapView.addAnnotation(pin)
        }
        //UI
        UIUtility.arrotondaAngoliCerchio(buttonCentraPosizioneUtente)
        
    }
    
    // MARK: - MapView Delegate
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        //controllo se è stato selezionato un "PinMappa"
        if let pin = view.annotation as? PinMappa {
            //prendo l'evento rappresentato dal pin
            if let eventoSelezionato = pin.eventoAssociato {
                
                //Calcolo distanza tra evento e mia posizionato
                if let miaPosizione = mapView.userLocation.location {
                    
                    let latitudine = eventoSelezionato.coordinate?.latitude ?? 0.0
                    let longitudine = eventoSelezionato.coordinate?.longitude ?? 0.0
                    
                    let posizioneEvento = CLLocation.init(latitude: latitudine, longitude: longitudine)
                    
                    let distanzaInMetri = miaPosizione.distance(from: posizioneEvento)
                    let distanzaInChilometri = distanzaInMetri / 1000.0
                    let stringaDistanza = String.init(format: "%.1f", distanzaInChilometri)
                    print("Distanza dall'evento: \(stringaDistanza) km")
                }
                
                //Creo la prossima schermata di pin selezionato
                
                //1. Prendo un riferimento allo storyboard dove risiede il view controller
                let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                
                //2. Instanzio il view controller attraverso il suo identifier
                let viewController = storyboard.instantiateViewController(withIdentifier: "DettaglioEventoController")
                
                //3. Passo l'evento selezionato al view controller di dettaglio
                if let dettaglioController = viewController as? DettaglioEventoController {
                    dettaglioController.evento = eventoSelezionato
                    
                   //Passo anche la posizione dell'utente
                    dettaglioController.miaPosizione = mapView.userLocation.location
                }
                
                //4. Apro il view controller in questione
                navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
    
    //MARK: - Actions
    
    //localizza utente
    @IBAction func buttonCentraPosizioneUtente(_ sender: Any) {
        
        //prendo le coordinate dell'utente(chiedendole alla mappa)
        let coordinate = mapView.userLocation.coordinate
        //controllo che siano valide
        if CLLocationCoordinate2DIsValid(coordinate){
            if coordinate.latitude != 0.0, coordinate.longitude != 0.0 {
                mapView.setCenter(coordinate, animated: true)
            }
        }
    }
    
    
}
