//
//  CartController.swift
//  Nicola Ricchiuti
//
//  Created by IED Student on 17/06/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

class CartController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //Mark : - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //TableView
        tableView.delegate = self
        tableView.dataSource = self
        
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
    
}
