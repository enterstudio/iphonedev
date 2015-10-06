//
//  PartyFeedViewController.swift
//  PartiesTonight
//
//  Created by mike tihonchik on 9/8/15.
//  Copyright © 2015 AngryGuy. All rights reserved.
//

import UIKit

class PartyFeedViewController: UIViewController {

    override func viewDidAppear(animated: Bool) {
        if (true) {
            let authController = UIStoryboard.loadAuthenticationController()
            if let authController = authController {
                self.presentViewController(authController, animated: true, completion: nil)
            }
        }
    }
}

