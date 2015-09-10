//
//  MainNavigationController.swift
//  PartiesTonight
//
//  Created by mike tihonchik on 9/8/15.
//  Copyright © 2015 AngryGuy. All rights reserved.
//

import UIKit

enum PrimaryScreen: String {
    case Feed = "Feed"
    case Authentiation = "Authentication"
}

/** Root view controller for app. It controls the 'main' visible view/view controller of the app. */
class MainNavigationController: UINavigationController {
    
    var currentRootVC: UIViewController?
    
    let isLoggedIn = true
    
    var initialDisplayScreen: PrimaryScreen {
        if appContext.isRegistrationComplete && !isLoggedIn {
            return PrimaryScreen.Authentiation
        } else {
            return PrimaryScreen.Authentiation  
        }
    }
    
    func _switchToPrimaryScreen(screen: PrimaryScreen, var animationOptions: UIViewAnimationOptions?) {
        
        var newRootVC: UIViewController
        var duration: NSTimeInterval = 0.5
        
        if animationOptions == nil {
            animationOptions = UIViewAnimationOptions.TransitionNone
        }
        
        if animationOptions == UIViewAnimationOptions.TransitionNone {
            duration = 0.0
        }
        
        switch (screen) {
            case .Authentiation:
                newRootVC = AuthenticationConstants.storyboard.instantiateViewControllerWithIdentifier(AuthenticationConstants.AuthenticationViewControllerId.Login.rawValue)
            
            case .Feed:
                newRootVC = PartiesConstants.storyboard.instantiateViewControllerWithIdentifier(PartiesConstants.PartiesViewControllerId.PartyTabBar.rawValue)
        }
        
        if currentRootVC == nil {
            self.setViewControllers([newRootVC], animated: false)
            currentRootVC = newRootVC
        } else {
            UIView.transitionWithView(self.view, duration: duration, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () in self.pushViewController(newRootVC, animated: false)
            },
            completion: {(success) in
                self.setViewControllers([newRootVC], animated: false)
                self.currentRootVC = newRootVC
        })}
    }
}
