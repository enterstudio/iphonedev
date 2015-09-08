//
//  PartyTabBartViewController.swift
//  PartiesTonight
//
//  Created by mike tihonchik on 9/8/15.
//  Copyright © 2015 AngryGuy. All rights reserved.
//

import UIKit

class PartyTabBartViewController: UITabBarController {
    
    override func viewWillAppear(animated: Bool) {
        let tabBar = self.tabBar
        let tabBarItem1 = tabBar.items![0] as UITabBarItem
        let tabBarItem2 = tabBar.items![1] as UITabBarItem
        let tabBarItem3 = tabBar.items![2] as UITabBarItem
        
        tabBarItem1.title = "OverALL"
        tabBarItem2.title = "My City"
        tabBarItem3.title = "My Spots"
        
        UITabBar.appearance().tintColor = UIColor(colorLiteralRed: 28/255, green:134/255, blue:244/255, alpha:1.0)
        UITabBar.appearance().backgroundColor = UIColor(colorLiteralRed: 248/255, green:248/255, blue:248/255, alpha:1.0)
    }
}