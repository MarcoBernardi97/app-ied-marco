//
//  DateUtility.swift
//  MarcoBernardi
//
//  Created by IED Student on 06/05/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

class DateUtility {

    //Funzione che converte un oggetto di tipo "Date" in una stringa
    static func stringa(conData data: Date?, formato: String?) -> String? {
    
        //controllo che i valori passati siano validi
        guard let data = data, let formato = formato else {
            return nil
        }
        //Converto l'oggetto di tipo "Date" in un oggetto "String"
        let formatter = DateFormatter()
        formatter.dateFormat = formato
        return formatter.string(from: data)
    }
    
    //Funzione che converte una stringa in una data
    static func data(conStringa stringa: String?, formato: String?) -> Date? {
        
        //controllo che i valori passati siano validi
        guard let stringa = stringa, let formato = formato else {
            return nil
        }
        
        //Converto l'oggetto di tipo "String" in un oggetto "Date"
        let formatter = DateFormatter()
        formatter.dateFormat = formato
        return formatter.date(from: stringa)
    }
    
}
