//
//  RegisterController.swift
//  MarcoBernardi
//
//  Created by IED Student on 05/04/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

class RegisterController: UIViewController {

    @IBOutlet weak var textName: UITextField!
    
    @IBOutlet weak var textCognome: UITextField!
    
    @IBOutlet weak var textEmail: UITextField!
    
    @IBOutlet weak var textPassword: UITextField!
    
    @IBOutlet weak var buttonConferma: UIButton!
    
    // MARK: - Setup della schermata
    
    override func viewDidLoad() {    // Do any additional setup after loading the view.
        super.viewDidLoad()
        
        //arrotondare angoli text email
        textEmail.layer.cornerRadius = textEmail.frame.size.height/2
        textEmail.layer.masksToBounds = true
        
        //arrotondare angoli text password
        textPassword.layer.cornerRadius = textPassword.frame.size.height/2
        textPassword.layer.masksToBounds = true
        
        //arrotondare angoli text nome
        textName.layer.cornerRadius = textName.frame.size.height/2
        textName.layer.masksToBounds = true
        
        //arrotondare angoli text cognome
        textCognome.layer.cornerRadius = textCognome.frame.size.height/2
        textCognome.layer.masksToBounds = true
        
        //arrotondare angoli button accedi
        buttonConferma.layer.cornerRadius = 10
        buttonConferma.layer.masksToBounds = true
    
    }
    
    // MARK: - Actions
    
    @IBAction func buttonConferma(_ sender: Any) {
        if textName.text != nil {
            if textCognome.text != nil {
                if textEmail.text != nil {
                    if textPassword.text != nil {
                        print("Registrazione completata")
                    }
                }
            }
        }
    }
}
