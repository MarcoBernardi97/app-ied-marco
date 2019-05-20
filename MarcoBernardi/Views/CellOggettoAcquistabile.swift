//
//  Cell OggettoAcquistabile.swift
//  MarcoBernardi
//
//  Created by IED Student on 13/05/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

class CellOggettoAcquistabile: UICollectionViewCell {
    
    //MARK: - Outlets
    
    @IBOutlet weak var containerInfo: UIView!
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var labelQuantita: UILabel!
    
    @IBOutlet weak var containerPrezzo: UIView!
    @IBOutlet weak var labelPrezzo: UILabel!
    
    func setupConOggettoAcquistabile(_ oggettoDaRappresentare: OggettoAcquistabile?){
        
        //Prendo immagineURL dall'HomeController
        NetworkUtility.downloadImmagine(indirizzoWeb: oggettoDaRappresentare?.immagineURL , perImageView: imageBackground)
        
        //Prendo il prezzo dall'HomeController
        if let prezzo = oggettoDaRappresentare?.prezzo, prezzo > 0.0 {
            labelPrezzo.text = String(format: "%.2f €", prezzo)
        } else {
            labelPrezzo.text = "Gratis"
        }
        
        //Prendo la quantità dall'HomeController
        if let quantita = oggettoDaRappresentare?.quantita, quantita > 0 {
            if quantita == 1 {
                labelQuantita.text = "\(quantita) disponibile"
            } else {
                labelQuantita.text = "\(quantita) disponibili"
            }
        } else {
            labelQuantita.text = "Nessuna disponibilità"
        }
        
        //Prendo il nome dall'HomeController
        labelNome.text = oggettoDaRappresentare?.nome
        
    }
}
