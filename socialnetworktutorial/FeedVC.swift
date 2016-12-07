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

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var feedTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedTable.delegate = self;
        feedTable.dataSource = self;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return feedTable.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
        
    }


    @IBAction func signOutTapped(_ sender: AnyObject) {
        let _ = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "goToSignin", sender: nil)
    }
    

}
