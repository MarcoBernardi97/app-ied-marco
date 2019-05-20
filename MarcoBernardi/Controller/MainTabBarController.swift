//
//  MainTabBarController.swift
//  MarcoBernardi
//
//  Created by IED Student on 20/05/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let tabBarItem = tabBar.items {
            
            let dimensioniIcone = CGSize(width: 30.0, height: 30.0)
            
            //Home
            if tabBarItem.count >= 1 {
                let itemHome = tabBarItem [0]
                
                itemHome.title = "Home"
                
                let image = UIImage(named: "iconHome")
                itemHome.image = UIUtility.resizeImage(image, targetSize: dimensioniIcone)
            }
            
            //Mappa
            if tabBarItem.count >= 2 {
                let itemMap = tabBarItem [1]
                
                itemMap.title = "Map"
                
                let image = UIImage(named: "iconMap")
               
                itemMap.image = UIUtility.resizeImage(image, targetSize: dimensioniIcone)
            }
        }
    }
    

    

    

}
