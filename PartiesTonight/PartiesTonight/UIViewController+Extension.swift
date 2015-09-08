//
//  UIViewController+Extension.swift
//  PartiesTonight
//
//  Created by mike tihonchik on 9/8/15.
//  Copyright © 2015 AngryGuy. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    /**
    Read-only computed var, returns the reference to the app-wide context object
    */
    
    func switchToPrimaryScreen(screen: PrimaryScreen, animationOptions: UIViewAnimationOptions?) {
        (UIApplication.sharedApplication().delegate as! AppDelegate).mainNC._switchToPrimaryScreen(screen, animationOptions: animationOptions)
    }
}