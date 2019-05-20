//
//  DettaglioEventoController.swift
//  MarcoBernardi
//
//  Created by IED Student on 06/05/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

class DettaglioEventoController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var evento: Evento?
    
    //MARK: - Outlets
    
    @IBOutlet weak var imageCopertina: UIImageView!
    
    @IBOutlet weak var labelNome: UILabel!
    
    @IBOutlet weak var labelIndirizzo: UILabel!
    
    @IBOutlet weak var labelDescrizione: UILabel!
    
    @IBOutlet weak var labelPrezzo: UILabel!
    
    @IBOutlet weak var labelData: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
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
        
        NetworkUtility.downloadImmagine(indirizzoWeb: evento.copertinaUrl, perImageView: imageCopertina)
        
        labelDescrizione.text = evento.descrizione
        
        labelData.text = DateUtility.stringa(conData: evento.data, formato: "dd/MM/yyyy HH:mm")
        
        if let prezzo = evento.prezzo, prezzo > 0.0 {
            labelPrezzo.text = String(format: "%.2f €", prezzo)
        } else {
            labelPrezzo.text = "Gratis"
        }
        
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
    
    //MARK: - CollectionView layout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //altezza pari a tutta l'altezza della collection view
        let altezza = collectionView.frame.size.height
        //larghezza pari ai 2/3 del totale della collection view
        let larghezzaTotale = collectionView.frame.size.width
        let larghezza = larghezzaTotale * 0.7
        
        return CGSize(width: larghezza, height: altezza)
    }
}
