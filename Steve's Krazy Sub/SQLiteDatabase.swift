//
//  SQLiteDatabase.swift
//  Steve's Krazy Sub
//
//  Created by Max Gerasymenko on 4/29/18.
//  Copyright © 2018 Max Gerasymenko. All rights reserved.
//

import Foundation
import UIKit

let sharedInstance = SQLiteDatabase()
class SQLiteDatabase : NSObject {
    
    private var database:FMDatabase? = nil
    
    class func getInstance() -> SQLiteDatabase{
  
        if (sharedInstance.database == nil){
            sharedInstance.database = FMDatabase(path: Util.getPath(fileName: "FMDBDatabase.sqlite"))
        }
        return sharedInstance
    }
    
    // Insert User's data into the table
    func insertData( User : User)-> Bool{
        // Open database
        sharedInstance.database!.open()
        
        let isInserted = sharedInstance.database!.executeUpdate(
            "INSERT INTO User(Name, Email, Password, Points) VALUES(?,?,?,?)" ,
            withArgumentsIn: [User.fullName, User.email, User.password, User.pointsDb])
        
        // Close database
        sharedInstance.database!.close()
        
        return isInserted
    }
    
    // find User's credentials 
    func findUserCredentials(email : String, password : String)-> Bool{
        // Open database
        sharedInstance.database!.open()
        
        // Transform Optional("value") from the table
        let sqlEmail = "Optional(\"" + email + "\")"
        let sqlPassword = "Optional(\"" + password + "\")"
        
        let resultSet = sharedInstance.database!.executeQuery("SELECT * FROM User", withArgumentsIn: [0])

        if (resultSet != nil){
            while (resultSet?.next())! {
                if ( sqlEmail == String(describing: resultSet?.string(forColumn: "Email")) &&
                    sqlPassword == String(describing: resultSet?.string(forColumn: "Password"))){
                    return true
                }
            }
        }
        
        // Close database
        sharedInstance.database!.close()
        
        return false
    }
}
