//
//  StatusBarContainerViewController.swift
//  PartiesTonight
//
//  Created by mike tihonchik on 9/15/15.
//  Copyright © 2015 AngryGuy. All rights reserved.
//

import UIKit

class StatusBarContainerViewController: UIViewController {
    
    @IBOutlet weak var settingsBtn: UIButton!
    @IBOutlet weak var mapBtn: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        
//        tabBarItem1.title = "OverALL"
//        tabBarItem2.title = "My City"
//        tabBarItem3.title = "My Spots"
        
        //UITabBar.appearance().tintColor = UIColor(red: 28/255, green:134/255, blue:244/255, alpha:1.0)
        self.view.backgroundColor = UIColor(red: 255/255, green:192/255, blue:0/255, alpha:1.0)
    }
    
    
    func handleMapBtn(sender: UIButton!) {
        let mapViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MapVC") as? PartyLocationViewController
        self.navigationController?.pushViewController(mapViewController!, animated: true)
    }
}

