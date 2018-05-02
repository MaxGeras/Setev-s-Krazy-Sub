//
//  User.swift
//  Steve's Krazy Sub
//
//  Created by Max Gerasymenko on 4/28/18.
//  Copyright © 2018 Max Gerasymenko. All rights reserved.
//

import Foundation

// All user's user credentials
class User{
    private var userFullName : String?
    private var userEmail : String?
    private var userPassword : String?
    private var id:Int = Int()
    private var points:Int = Int()
    
    init(){
        self.userFullName = ""
        self.userEmail = ""
        self.userPassword = ""
        self.id = 1
    }
    
    init(userFullname : String, userEmail : String, userPass : String, id : Int, points : Int) {
        self.userFullName = userFullname
        self.userEmail = userEmail
        self.userPassword = userPass
        self.id = id
        self.points = points
    }
    
    var fullName : String {
        set { userFullName = newValue }
        get { return userFullName!    }
    }
    
    var email : String {
        set { userEmail = newValue    }
        get { return userEmail!       }
    }
    
    var password : String {
        set { userPassword = newValue }
        get { return userPassword!    }
    }
    
    var idDb : Int {
        set { id = newValue           }
        get { return id               }
    }
    
    var pointsDb : Int {
        set { points = newValue       }
        get { return points           }
    }
    func alert(){
        
    }
}
