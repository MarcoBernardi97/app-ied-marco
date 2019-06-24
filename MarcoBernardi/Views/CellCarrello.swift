//
//  CellCarrello.swift
//  Nicola Ricchiuti
//
//  Created by IED Student on 17/06/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

class CellCarrello: UITableViewCell {

    //Mark: - Outlets
    @IBOutlet weak var labelNome: UILabel!
    
    //Mark: - Setup
    
    func setupConOggettoAcquistabile(_ oggetto: OggettoAcquistabile?){
        labelNome.text = oggetto?.nome
    }
    
}
