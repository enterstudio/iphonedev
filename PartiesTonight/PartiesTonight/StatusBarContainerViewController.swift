//
//  StatusBarContainerViewController.swift
//  PartiesTonight
//
//  Created by mike tihonchik on 9/15/15.
//  Copyright © 2015 AngryGuy. All rights reserved.
//

import UIKit

class StatusBarContainerViewController: UIViewController {
    
    override func viewWillAppear(animated: Bool) {
        let addPartyBtn = UIBarButtonItem(title: "+", style: .Done, target: self, action: "handleAddPartyBtn:")
        let settingsBtn = UIBarButtonItem(title: "SET", style: .Done, target: self, action: "handleAddPartyBtn:")
        let locationBtn = UIBarButtonItem(title: "MAP", style: .Done, target: self, action: "handleMapBtn:")
        navigationItem.rightBarButtonItems = [settingsBtn, addPartyBtn]
        navigationItem.leftBarButtonItem = locationBtn
        
//        let tabBar = self.tabBar
//        let tabBarItem1 = tabBar.items![0] as UITabBarItem
//        let tabBarItem2 = tabBar.items![1] as UITabBarItem
//        let tabBarItem3 = tabBar.items![2] as UITabBarItem
        
//        tabBarItem1.title = "OverALL"
//        tabBarItem2.title = "My City"
//        tabBarItem3.title = "My Spots"
        
        //UITabBar.appearance().tintColor = UIColor(red: 28/255, green:134/255, blue:244/255, alpha:1.0)
        self.view.backgroundColor = UIColor(red: 28/255, green:134/255, blue:244/255, alpha:1.0)
    }
    
    
    func handleMapBtn(sender: UIButton!) {
        let mapViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MapVC") as? PartyLocationViewController
        self.navigationController?.pushViewController(mapViewController!, animated: true)
    }
}
