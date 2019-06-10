//
//  Network.swift
//  MarcoBernardi
//
//  Created by IED Student on 10/06/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

//Classe che si occuperà di gesitre tutte le chiamate ai servizi web esterni dell'app
class Network {
    
    
    //funzione per chiedere al server il meteo attuale di roma
    static func richiestaMeteoRoma(){
        let url = "http://ied.apptoyou.it/app/meteoroma.php"
        IEDNetworking.jsonGet(url: url, authToken: nil, parameters: nil) {
            //Questa parte di codice viene eseguita quando l'app riceve la risposta del server
            (risposta) in
            
            //controllo se la chiamata è andata a buon fine
            if risposta.success {
                //controllo se i dati ricevuti sono del tipo che mi aspettavo
                if let temperatura = risposta.data as? Int {
                    print("La temperatura a Roma è di \(temperatura) °C")
                }
            }
        }
    }
    
    //questo è il risultato della funzione di richiesta meteo evento
    typealias CompletionMeteo = ((Meteo?) -> Void)
    
    //funzione per chiedere al server il meteo attuale del luogo dell'evento
    static func richiestaMeteoEvento(_ evento: Evento?, completion: CompletionMeteo?) {
    
        //check validità dei dati
        guard let coordinate = evento?.coordinate else {
            //dati non validi
            return
        }
        //Indirizzo web da passare al servizio
        let url = "http://ied.apptoyou.it/app/weather.php"
        //parametri da passare al servizio
        var parametri = IEDDictionary()
        parametri["appid"] = "7854e283b3c65ba9943d850e002019b4"
        parametri["units"] = "metric"
        parametri["lang"] = "it"
        
        parametri["lat"] = coordinate.latitude
        parametri["lon"] = coordinate.longitude
        
        //richiamo il servizio
        IEDNetworking.jsonGet(url: url, authToken: nil, parameters: parametri) {
            
            (risposta) in
            if risposta.success {
                //print(risposta.data)
                if let dictionary = risposta.data as? IEDDictionary {
                    //Faccio il parse della risposta
                    let meteo = NetworkParser.parseMeteo(conData: dictionary)
                    
                    //restituisco il meteo alla funzione chiamante
                    completion?(meteo)
                    
                    print("La temperatura è di \(meteo?.temperatura ?? 0)°C, \(meteo?.descrizione ?? "").")
                    

                }
            }
        }
    }
    
}
