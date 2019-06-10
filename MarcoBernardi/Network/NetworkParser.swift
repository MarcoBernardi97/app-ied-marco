//
//  NetworkParser.swift
//  MarcoBernardi
//
//  Created by IED Student on 10/06/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit
//classe che serve a trasformare le risposte de servizi web in oggetti utilizzabli dall'app
class NetworkParser {
    static func parseMeteo(conData data: IEDDictionary) -> Meteo? {
        let meteo = Meteo()
        
        //traduzione dati inviati dal server
        if let main = data["main"] as? IEDDictionary {
            meteo.temperatura = main["temp"] as? Double
        }
        
        if let weather = data["weather"] as? IEDArray{
            
            //Prendo il primo elemento dell'array "weather"
            if let firstWeather = weather.first {
                meteo.descrizione = firstWeather["description"] as? String
            }
        }
        
        return meteo
    }
}
