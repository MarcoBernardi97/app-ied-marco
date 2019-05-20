//
//  CellEvento.swift
//  MarcoBernardi
//
//  Created by IED Student on 08/04/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

class CellEvento: UITableViewCell {

    //MARK: - outlets
    @IBOutlet weak var labelData: UILabel!
    
    @IBOutlet weak var labelNome: UILabel!
    
    @IBOutlet weak var labelIndirizzo: UILabel!
    
    @IBOutlet weak var labelPrezzo: UILabel!
    
    @IBOutlet weak var imageCopertina: UIImageView!
    
    //MARK: - Setup della cella
    
    //questa funzione si occupa di prendere tutte le informazioni dal modello "Evento" e metterle su ogni frafico della cella(Outlets)
    func setupConEvento(_ evento: Evento){
        
        labelNome.text = evento.nome
        
        labelIndirizzo.text = evento.indirizzo
        
        if let prezzo = evento.prezzo, prezzo > 0.0 {
            labelPrezzo.text = String(format: "da %.2f €", prezzo)
        } else {
            labelPrezzo.text = "Gratis"
        }
        
        //metto immagine di copertina
        NetworkUtility.downloadImmagine(indirizzoWeb: evento.copertinaUrl, perImageView: imageCopertina)
        
        //metto data evento
        labelData.text = DateUtility.stringa(conData: evento.data, formato: "dd/MM/yyyy")
        
    }
    
}
