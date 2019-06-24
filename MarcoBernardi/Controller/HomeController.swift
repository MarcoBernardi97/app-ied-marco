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
        
        navigationItem.title = "Lista Eventi"
        
        //Questo serve per comincare con la TableView
        tableView.delegate = self
        tableView.dataSource = self
        listaEventi = Database.eventi
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        aggiornaPulsanteCarrello()
    }
    
    //MARK: - Funzioni
    func aggiornaPulsanteCarrello (){
        let buttonCarrello = UIBarButtonItem.init(image: CartUtility.iconaCarrello(), style: .plain, target: self, action: #selector(apriCarrello))
        navigationItem.rightBarButtonItem = buttonCarrello
    }
    
    @objc func apriCarrello(){
        
        //instanzio lo storyboard che contiene il view controller
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        //instanzio il view controller del carrello
        let viewController = storyboard.instantiateViewController(withIdentifier: "CartController")
        
        //creo un navigation controller (per averte la barra superiore)
        let navigationController = UINavigationController.init(rootViewController: viewController)
        
        //presento il viewController come "modale"
        present(navigationController, animated: true)
        
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
