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
        imageIcon.layer.cornerRadius = 20
        imageIcon.layer.masksToBounds = true
        
        buttonAccedi.layer.cornerRadius = 10
        buttonAccedi.layer.masksToBounds = true
        
    }
    
    
}
