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
        
        UIUtility.arrotondaAngoli(buttonAccedi, raggio: 16.0)

       
    }
    
    // MARK: - Funcions
    
    private func controllaValiditaDatiInseriti() -> Bool {
        
        //controllo campo dell'email
        if textEmail.text == nil || textEmail.text == "" {
            print("Devi specificare l'email")
            return false
        }
        
        //controllo campo della password
        if textPassword.text == nil || textPassword.text == "" {
            print("Devi specificare la password")
            return false
        }
        
        //tutto confermato
        return true
    }

    // MARK: - Actions
    
    @IBAction func buttonAccedi(_ sender: Any) {
      
        guard controllaValiditaDatiInseriti() else {
            //dati non validi
            return
        }
        
        Network.richiestaLogin(conEmail: textEmail.text, password: textPassword.text) {
            (utente) in
            if let utente = utente {
                
                print("Login Riuscito")
                
                //salvo in memoria l'utente appena ricevuto dal server
                LoginUtility.utenteConnesso = utente
                
                //vado alla schermata principale dell'app
                self.performSegue(withIdentifier: "VaiAllaHome", sender: self)
            }
            else {
                AlertUtility.mostraAlertSemplice(titolo: "Login fallito", messaggio: "Prova a controllare email o password", viewController: self)
            }
        }
    print("Dati validi")
        
    }
}
    


