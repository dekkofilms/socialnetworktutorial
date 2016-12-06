//
//  FeedVC.swift
//  socialnetworktutorial
//
//  Created by Taylor King on 12/6/16.
//  Copyright © 2016 Taylor King. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func signOutTapped(_ sender: AnyObject) {
        let _ = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "goToSignin", sender: nil)
    }
    

}
