//
//  AuthenticationViewController.swift
//  PartiesTonight
//
//  Created by mike tihonchik on 9/8/15.
//  Copyright © 2015 AngryGuy. All rights reserved.
//

import UIKit
import TwitterKit

class AuthenticationViewController: UIViewController, GIDSignInUIDelegate {
    
    @IBOutlet weak var googleSignInBtn: UIView!
    @IBOutlet weak var twitterSignInBtn: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
        // Uncomment to automatically sign in the user.
        //GIDSignIn.sharedInstance().signInSilently()
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...
        
        twitterSignInBtn = TWTRLogInButton { (session, error) in
            // play with Twitter session
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }
}