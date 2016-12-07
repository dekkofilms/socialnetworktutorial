//
//  DataService.swift
//  socialnetworktutorial
//
//  Created by Taylor King on 12/7/16.
//  Copyright © 2016 Taylor King. All rights reserved.
//

import UIKit
import Firebase

//Root URL for our database (references our Google plist file
let DB_BASE = FIRDatabase.database().reference()

class DataService {
    
    //Making this a singleton
    static let ds = DataService()
    
    
    //Common Endpoints
    private var _REF_BASE = DB_BASE
    private var _REF_POSTS = DB_BASE.child("posts")
    private var _REF_USERS = DB_BASE.child("users")
    
    var REF_BASE: FIRDatabaseReference {
        return _REF_BASE
    }
    
    var REF_POSTS: FIRDatabaseReference {
        return _REF_POSTS
    }
    
    var REF_USERS: FIRDatabaseReference {
        return _REF_USERS
    }
    
    func createFirebaseDBUser(uid: String, userData: Dictionary<String, String>) {
        //If it's not there, Firebase will auto create it for you
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
}
