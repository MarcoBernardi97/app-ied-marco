//
//  SplashController.swift
//  MarcoBernardi
//
//  Created by IED Student on 08/04/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

class SplashController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //Controllare se c'è un utente connesso
        if LoginUtility.utenteConnesso == nil {
            performSegue(withIdentifier: "VaiAllaLogin", sender: self)
        }
        else{
           performSegue(withIdentifier: "VaiAllaHome", sender: self)
        }
        
    }

}
