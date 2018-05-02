//
//  SignInViewController.swift
//  Steve's Krazy Sub
//
//  Created by Max Gerasymenko on 4/29/18.
//  Copyright © 2018 Max Gerasymenko. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var loginEmail: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func logInButton(_ sender: Any) {
        
        let email = loginEmail.text!
        let password = loginPassword.text!
        
        let isAuthenticated = SQLiteDatabase.getInstance().findUserCredentials(email: email, password: password)
        
        if (!isAuthenticated){
            Util.invokeAlertMethod(strTitle: "Sorry!", strBody: "Your account was not found! Please, check your email and password", delegate: nil)
            return
        }
        
        // Set localy isLoggedIn to true
        UserDefaults.standard.set(true, forKey:"isLoggedIn");
        UserDefaults.standard.synchronize()
        self.dismiss(animated: true, completion : nil)
        
    }
    

}
