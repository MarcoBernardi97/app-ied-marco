//
//  BenvenutoController.swift
//  MarcoBernardi
//
//  Created by IED Student on 24/06/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

class BenvenutoController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var imageIcon: UIImageView!
    
    @IBOutlet weak var buttonAccedi: UIButton!
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
       
        
        UIUtility.arrotondaAngoliCerchio(imageIcon)
        
        UIUtility.arrotondaAngoli(buttonAccedi, raggio: 16.0)
        
    }
    
    
}
