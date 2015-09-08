//
//  AppContext.swift
//  PartiesTonight
//
//  Created by mike tihonchik on 9/8/15.
//  Copyright © 2015 AngryGuy. All rights reserved.
//

import Foundation

class AppContext {
    var isRegistrationComplete: Bool {
        get { return NSUserDefaults.standardUserDefaults().objectForKey(UserDefaultsKeys.RegistrationComplete.rawValue) as? Bool ?? false }
        set { NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: UserDefaultsKeys.RegistrationComplete.rawValue) }
    }
}