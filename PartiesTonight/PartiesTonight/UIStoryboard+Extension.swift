//
//  UIStoryboard+Extension.swift
//  PartiesTonight
//
//  Created by mike tihonchik on 10/5/15.
//  Copyright © 2015 AngryGuy. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    private static let partiesStoryboardName = "Parties"
    private static let authenticationStoryboardName = "Authentication"
    
    // MARK - Parties Storyboard
    class func loadPartiesTabBarController() -> UITabBarController {
        let storyboard = UIStoryboard(name: partiesStoryboardName, bundle: nil)
        return storyboard.instantiateViewControllerWithIdentifier("PartyTabBarViewController") as! PartyTabBarViewController
    }

    // MARK - Authentication Storyboard
    class func loadAuthenticationController() -> UIViewController? {
        let storyboard = UIStoryboard(name: authenticationStoryboardName, bundle: nil)
        return storyboard.instantiateViewControllerWithIdentifier("AuthenticationViewController") as! AuthenticationViewController
    }
}
