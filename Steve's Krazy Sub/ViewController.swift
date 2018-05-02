//
//  ViewController.swift
//  Steve's Krazy Sub
//
//  Created by Max Gerasymenko on 4/28/18.
//  Copyright © 2018 Max Gerasymenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // call Log In page
    // check if user is logged in
    override func viewDidAppear(_ animated: Bool) {
        
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn");
        
        if(!isUserLoggedIn){
            self.performSegue(withIdentifier: "loginView", sender: self);
        }
    }
    
    // Log out Button
    @IBAction func logOutButton(_ sender: Any) {
        // Set localy isLoggedIn to false
        UserDefaults.standard.set(false, forKey:"isLoggedIn");
        UserDefaults.standard.synchronize();
     
        // Go back to Sign In page
        self.performSegue(withIdentifier: "loginView", sender: self);
    }
    
}

