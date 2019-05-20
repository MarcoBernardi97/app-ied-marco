//
//  LoginController.swift
//  MarcoBernardi
//
//  Created by IED Student on 01/04/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var textEmail: UITextField!
    
    @IBOutlet weak var textPassword: UITextField!
    
    @IBOutlet weak var buttonAccedi: UIButton!
    
    // MARK: - Setup della schermata
    
    override func viewDidLoad() {    // Do any additional setup after loading the view.
        super.viewDidLoad()
        
        //arrotondare angoli text email
        textEmail.layer.cornerRadius = textEmail.frame.size.height/2
        textEmail.layer.masksToBounds = true
        
        //arrotondare angoli text password
        textPassword.layer.cornerRadius = textPassword.frame.size.height/2
        textPassword.layer.masksToBounds = true
        
        //arrotondare angoli button accedi
        buttonAccedi.layer.cornerRadius = 10
        buttonAccedi.layer.masksToBounds = true

       
    }

    // MARK: - Actions
    
    @IBAction func buttonAccedi(_ sender: Any) {
        if textEmail.text == "gmail.com" {
           
            if textPassword.text == "password" {
                print("Accesso eseguito")
                performSegue(withIdentifier: "VaiAllaHome", sender: self)
            }
        }
        else
        {
            print("Accesso negato")
            
        }
    }
}
    


