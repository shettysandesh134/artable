//
//  RegisterVC.swift
//  Artable
//
//  Created by Sandesh Shetty on 12/5/19.
//  Copyright © 2019 Sandesh Shetty. All rights reserved.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {

    //Outlets
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var confirmPasswordTxt: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var passCheckImg: UIImageView!
    @IBOutlet weak var confirmCheckImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        passwordTxt.addTarget(self, action: #selector(textFieldChanged(_:)), for: UIControl.Event.editingChanged)
        confirmPasswordTxt.addTarget(self, action: #selector(textFieldChanged(_:)), for: UIControl.Event.editingChanged)
        // Do any additional setup after loading the view.
    }
    
    @objc func textFieldChanged(_ textfield: UITextField) {
        guard let passText = passwordTxt.text else {return}
        
        // if we have started typing in confirmpassword text then only image shown
        if textfield == confirmPasswordTxt {
            passCheckImg.isHidden = false
            confirmCheckImg.isHidden = false
        }else {
            if passText.isEmpty {
                passCheckImg.isHidden = true
                confirmCheckImg.isHidden = true
                confirmPasswordTxt.text = ""
            }
        }
        
        // Make it so when the password match the checkmarks turn green
        if passwordTxt.text == confirmPasswordTxt.text {
            passCheckImg.image = UIImage(named: AppImages.GreenCheckImage)
            confirmCheckImg.image = UIImage(named: AppImages.GreenCheckImage)
        }else{
            passCheckImg.image = UIImage(named: AppImages.RedCheckImage)
            confirmCheckImg.image = UIImage(named: AppImages.RedCheckImage)
        }
    }
    
    @IBAction func registerClicked(_ sender: UIButton) {
        
        guard let email = emailTxt.text, email.isNotEmpty ,
            let username = usernameTxt.text, username.isNotEmpty ,
            let password = passwordTxt.text, password.isNotEmpty else {return}
        
        activityIndicator.startAnimating()
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            
            if let error = error {
                debugPrint(error)
                return
            }
            
            self.activityIndicator.stopAnimating()
            print("Successfull registered new user")
            //guard let user = result?.user else {return}
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
