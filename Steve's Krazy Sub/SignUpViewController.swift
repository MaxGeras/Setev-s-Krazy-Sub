//
//  SignUpViewController.swift
//  Steve's Krazy Sub
//
//  Created by Max Gerasymenko on 4/28/18.
//  Copyright © 2018 Max Gerasymenko. All rights reserved.
//

import UIKit


class SignUpViewController: UIViewController {
    var user : User!
    
    
    // Sign Up page user's credentials

    @IBOutlet weak var userFullName: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var repeatPass: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Sing Up Button pressed by the User
    @IBAction func signUpButton(_ sender: Any) {
       
        user = User()
        
        self.user.fullName = userFullName.text!;
        self.user.email = userEmail.text!;
        self.user.password = userPassword.text!;
        let password = repeatPass.text!;
        
        if ( self.user.fullName.isEmpty || self.user.email.isEmpty || self.user.password.isEmpty || password.isEmpty){
  
            alertMessage(alertText: "All Fields are required to be filled out!")
            return ;
        }
        
        if( password != self.user.password){
            
            alertMessage(alertText: "Password does not match!")
            return ;
        }
        
        let isInserted = SQLiteDatabase.getInstance().insertData(User: user)
        
        if (isInserted){
            Util.invokeAlertMethod(strTitle: "", strBody: "Your account was succesfully created", delegate: nil)
            alertMessage(alertText: "Congratulations! You successfully signed up!")
        }else{
            Util.invokeAlertMethod(strTitle: "Error", strBody: "Your account was not created. Check your internet connection!", delegate: nil)
            
            return ;
        }
    }
    
    private func alertMessage(alertText : String){
        
        if (alertText.range(of:"Congratulations! ") == nil){
            let alert = UIAlertController(title: "Error", message: alertText, preferredStyle:UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title : "OK", style: UIAlertActionStyle.default, handler: nil ));
            self.present(alert, animated : true, completion: nil)
        }
        else{
            let alert = UIAlertController(title: "Done", message: alertText, preferredStyle:UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title : "OK", style: UIAlertActionStyle.default){ action in self.dismiss(animated: true, completion: nil)})
            self.present(alert, animated : true, completion: nil)
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
