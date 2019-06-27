//
//  ProfileController.swift
//  MarcoBernardi
//
//  Created by IED Student on 26/06/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {
    
    //MARK: - Outlets

    @IBOutlet weak var avatarProfilo: UIImageView!
    
    @IBOutlet weak var labelNome: UILabel!
    
    @IBOutlet weak var labelDataNascita: UILabel!
    
    @IBOutlet weak var labelCitta: UILabel!
    
    @IBOutlet weak var labelEmail: UILabel!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Profilo"
        
        NetworkUtility.downloadImmagine(indirizzoWeb: "http://ied.apptoyou.it/app/avatars/default.jpg", perImageView: avatarProfilo)
        
        let nome = LoginUtility.utenteConnesso?.nome
        let cognome = LoginUtility.utenteConnesso?.cognome
        
        let nomeCompleto = nome! + " " + cognome!
        
        labelNome.text = nomeCompleto
        
        labelCitta.text = LoginUtility.utenteConnesso?.citta
        
        labelDataNascita.text = LoginUtility.utenteConnesso?.data_nascita
        
        labelEmail.text = LoginUtility.utenteConnesso?.email
        
        
        
       
    }

   

}
