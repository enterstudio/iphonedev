//
//  AppConstants.swift
//  PartiesTonight
//
//  Created by mike tihonchik on 9/8/15.
//  Copyright © 2015 AngryGuy. All rights reserved.
//

import UIKit
import Foundation

let appDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
let appContext = appDelegate.appContext

enum UserDefaultsKeys : String {
    case RegistrationComplete = "registrationComplete"
}