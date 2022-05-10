//
//  ViewController.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/09.
//

import UIKit

class MainViewController: UITabBarController {
    
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
        
        self.viewControllers = [homeVC]
        
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = UIColor(red: 0/255, green: 183/255, blue: 119/255, alpha: 1)
        self.tabBar.unselectedItemTintColor = UIColor(red: 176/255, green: 176/255, blue: 176/255, alpha: 1)
    }

}

