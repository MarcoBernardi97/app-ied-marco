//
//  CartUtility.swift
//  Nicola Ricchiuti
//
//  Created by IED Student on 17/06/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

//Classe che gestisce il carrello
class CartUtility {

    //Lista di oggetti da acquistare
    static var carrello: [OggettoAcquistabile] = []
    
    //Funzione che aggiunge al carrello , solo se non è già stato inserito
    static func aggiungiAlCarrello (_ oggetto: OggettoAcquistabile){
        //1.Controlla se l'oggetto è già nel carrello
        
        for ricercaOggetto in carrello {
            
            if ricercaOggetto.nome == oggetto.nome{
                //Oggetto già stato aggiunto
                print("L'oggetto NON è stato aggiunto al carrello-")
                return
            }
        }
        //2.Aggiungi l'oggetto al carrello
        carrello.append(oggetto)
        Sound.play(file: "addToCart.wav")
        
        print ("L'oggetto è stato aggiunto al carrello")
    }
    
    //funzione che rimuove l'oggetto dal carrello
    static func rimuoviDalCarrello(_ oggetto: OggettoAcquistabile){
        if let index = carrello.index(of: oggetto){
            carrello.remove(at: index)
        }
    }
    
    //Funzione che setta l'icona corretta per il carrello
    static func iconaCarrello() ->UIImage?{
        
        var image: UIImage?
        
        if carrello.count > 0{
            //carrello pieno
            image = UIImage(named: "iconCartFull")
        } else{
            //carrello vuoto
            image = UIImage(named: "iconCartEmpty")
        }
        
        //Ridimensiono l'immagine
        image = UIUtility.resizeImage(image, targetSize: CGSize(width:34.0, height: 34.0))
        
        //Per preservare i colori
        image = image?.withRenderingMode(.alwaysOriginal)
        return image
    }
}

