//
//  CartController.swift
//  MarcoBernardi
//
//  Created by IED Student on 17/06/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

class CartController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var labelNessunArticolo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //TableView
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
        
        //pulsante chiusura
        let chiudi = UIBarButtonItem.init(title: "Chiudi", style: .plain, target: self, action: #selector(buttonChiudi))
        navigationItem.rightBarButtonItem = chiudi
        
        setupController()
    }
    
    func setupController(){
        
        //titolo
        if(CartUtility.carrello.count > 0) {
            let numeroArticoli = CartUtility.carrello.count
            navigationItem.title = "Carrello"
        }
        else {
            navigationItem.title = "Carrello"
        }
        
        if (CartUtility.carrello.count > 0) {
            labelNessunArticolo.isHidden = true
        }
        else{
            labelNessunArticolo.isHidden = false
        }
        
    }
    
    @objc func buttonChiudi(){
        dismiss(animated: true)
    }
    
    
    // Mark: - delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CartUtility.carrello.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellCarrello") as! CellCarrello
        
        //Prendo l'oggetto da rappresenyare sulla cella
        let oggetto = CartUtility.carrello[indexPath.row]
        cell.setupConOggettoAcquistabile(oggetto)
        
        return cell
    }
    
    //editing celle tableview
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if (editingStyle == .delete) {
            let oggetto = CartUtility.carrello[indexPath.row]
            
            CartUtility.rimuoviDalCarrello(oggetto)
            
            setupController()
            
            tableView.reloadData()
            
        }
    }
    
}
