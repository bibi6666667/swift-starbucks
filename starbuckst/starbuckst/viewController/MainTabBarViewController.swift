//
//  ViewController.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/09.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let homeVC = HomeViewController()
        let homeTabBarItem = UITabBarItem(title: "Home",
                                          image: UIImage(systemName: "house"),
                                          selectedImage: UIImage(systemName: "house.fill"))
        homeVC.tabBarItem = homeTabBarItem
        
        let orderVC = OrderViewController()
        let orderTabBarItem = UITabBarItem(title: "Order",
                                           image: UIImage(systemName: "cup.and.saucer"),
                                           selectedImage: UIImage(systemName: "cup.and.saucer.fill"))
        orderVC.tabBarItem = orderTabBarItem
        
        self.viewControllers = [homeVC, orderVC]
        
        self.tabBar.backgroundColor = UIColor.customColor(.white)
        self.tabBar.tintColor = UIColor.customColor(.primaryGreen)
        self.tabBar.unselectedItemTintColor = UIColor.customColor(.gray)
    }

}

