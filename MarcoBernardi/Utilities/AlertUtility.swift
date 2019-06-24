//
//  AlertUtility.swift
//  Nicola Ricchiuti
//
//  Created by IED Student on 17/06/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

class AlertUtility {
    
    //Funzione che viene chiamata quando l'utente compie una scelta nell'alert di conferma (il parametro Bool ci dice se l'utente ha premuto si o no)
    typealias CompletionAlertDiConferma = ((Bool) -> Void)
    
    //Mostra un alert di conferma sul view controller specifico
    static func mostraAlertDiConferma (conTitolo titolo: String?, messaggio: String?, viewController: UIViewController, completion: CompletionAlertDiConferma?) {
        
        //1. Creo alert
        let alert = UIAlertController.init(title: titolo, message: messaggio, preferredStyle: .alert)
        
        //2. Creo l'azione del tasto "si"
        let actionSi = UIAlertAction.init(title: "Si", style: .default) { (acion) in
            
            //Comunico che l'utente  ha premuto "si" alla classe che ha mosrato l'alert
            completion?(true)
        }
        //2b. Aggiungo l'azione all'alert
        alert.addAction(actionSi)
        
        //3.a Creo l'azione del tasto "no"
        let actionNo = UIAlertAction.init(title: "No", style: .cancel) { (acion) in
            
            //Comunico che l'utente  ha premuto "si" alla classe che ha mosrato l'alert
            completion?(false)
        }
        //3b. Aggiungo l'azione all'alert
        alert.addAction(actionNo)
        
        //4. Aggiungo l'azione all'alert
        viewController.present(alert, animated: true)
    }
    
    static func mostraAlertSemplice(titolo: String?, messaggio: String?, viewController: UIViewController?){
        
        //1. Creo alert
        let alert = UIAlertController.init(title: titolo, message: messaggio, preferredStyle: .alert)
        
        //2. Creo l'azione del tasto "ok"
        let actionChiudi = UIAlertAction(title: "OK 👍🏼", style: .default)
        
        //3. Aggiungo l'azione all'alert
        alert.addAction(actionChiudi)
        
        //4. Mostro l'alert
        viewController?.present(alert, animated: true)
        
        
    }
}

