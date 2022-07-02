//
//  TabBarController.swift
//  frasedodia
//
//  Created by Joao Barros on 02/07/22.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let homeController = HomeController()
        let receivedController = ReceivedController()
        
        homeController.title = "Home"
        receivedController.title = "Received"
        
        self.setViewControllers([homeController, receivedController], animated: false)
        
        guard let items = self.tabBar.items else { return }
        
        let images = ["house","target"]
        
        for x in 0...1 {
            items[x].image = UIImage(systemName: images[x])
        }
        
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .black
    }

}
