//
//  HomeController.swift
//  MarcoBernardi
//
//  Created by IED Student on 08/04/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

class HomeController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var listaEventi: [Evento] = []
    
    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //Questo serve per comincare con la TableView
        tableView.delegate = self
        tableView.dataSource = self
        creaEventiDiProva()
    }
    func creaEventiDiProva () {
        let eventoUno = Evento()
        eventoUno.nome = "Concertone"
        eventoUno.data = DateUtility.data(conStringa: "08/09/2020 20:30", formato: "dd/MM/yyyy HH:mm")
        eventoUno.indirizzo = "V.le Oceano Atlantico"
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
        
        listaEventi.append(eventoUno)
        
        let due = Evento()
        due.nome = "Lezione app design"
        due.data = Date()
        due.indirizzo = "Via Alcamo 11"
        due.prezzo = 55.0
        due.copertinaUrl = "https://images.unsplash.com/photo-1514525253161-7a46d19cd819?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80"
        due.descrizione = "La lezione è dalle 15.00 alle 18.00"
        
        //creo un oggetto acquistabile
        

        
        listaEventi.append(due)
        
        let tre = Evento()
        tre.nome = "Lezione app design"
        tre.data = Date()
        tre.indirizzo = "Via Alcamo 11"
        tre.prezzo = 55.0
        tre.copertinaUrl = "https://images.unsplash.com/photo-1514525253161-7a46d19cd819?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80"
        tre.descrizione = "La lezione è dalle 15.00 alle 18.00"

        
        listaEventi.append(tre)
    }
    //MARK: - TableView delegate
    
    //In questa funzione l'HomeController comunica alla TableView quante righe deve disegnare
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listaEventi.count
    }
    
    //In questa funzione l'HomeController comunica alla TableView COME deve disegnare ogni riga (la UI)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cella = tableView.dequeueReusableCell(withIdentifier: "CellEvento") as! CellEvento
        let evento = listaEventi[indexPath.row]
        cella.setupConEvento(evento)
        
        return cella
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Recupero l'evento associato alla cella che è stata selezionata dall'utente
        let eventoSelezionato = listaEventi[indexPath.row]
        
        //Creo la prossima schermata di dettaglio dell'evento
        
        //1. Prendo un riferimento allo storyboard dove risiede il view controller
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        //2. Instanzio il view controller attraverso il suo identifier
        let viewController = storyboard.instantiateViewController(withIdentifier: "DettaglioEventoController")
        
        //3. Passo l'evento selezionato al view controller di dettaglio
        if let dettaglioController = viewController as? DettaglioEventoController {
            dettaglioController.evento = eventoSelezionato
        }
        
        //4. Apro il view controller in questione
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
