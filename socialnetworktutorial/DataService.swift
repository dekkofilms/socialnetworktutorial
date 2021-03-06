//
//  DataService.swift
//  socialnetworktutorial
//
//  Created by Taylor King on 12/7/16.
//  Copyright © 2016 Taylor King. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

//Root URL for our database (references our Google plist file
let DB_BASE = FIRDatabase.database().reference()
let STORAGE_BASE = FIRStorage.storage().reference()

class DataService {
    
    //Making this a singleton
    static let ds = DataService()
    
    
    //Common Endpoints
    private var _REF_BASE = DB_BASE
    private var _REF_POSTS = DB_BASE.child("posts")
    private var _REF_USERS = DB_BASE.child("users")
    
    //Storage references
    private var _REF_POST_IMAGES = STORAGE_BASE.child("post-pics")
    
    var REF_BASE: FIRDatabaseReference {
        return _REF_BASE
    }
    
    var REF_POSTS: FIRDatabaseReference {
        return _REF_POSTS
    }
    
    var REF_USERS: FIRDatabaseReference {
        return _REF_USERS
    }
    
    var REF_USER_CURRENT: FIRDatabaseReference {
        let uid = KeychainWrapper.standard.string(forKey: KEY_UID)
        //this is sloppy unwrapping
        let user = REF_USERS.child(uid!)
        return user
    }
    
    var REF_POST_IMAGES: FIRStorageReference {
        return _REF_POST_IMAGES
    }
    
    func createFirebaseDBUser(uid: String, userData: Dictionary<String, String>) {
        //If it's not there, Firebase will auto create a new user
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
    
    
}
