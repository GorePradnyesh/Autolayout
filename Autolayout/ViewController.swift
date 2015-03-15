//
//  ViewController.swift
//  Autolayout
//
//  Created by pgore on 3/15/15.
//  Copyright (c) 2015 Pradnyesh Gore. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginField: UITextField!
    
    var kSecurePassword = true;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateUI();
    }
    
    func updateUI() {
        passwordField.secureTextEntry = kSecurePassword;
        passwordLabel.text = passwordField.secureTextEntry ? "Secure Password" : "Password";
    }

    @IBAction func toggleSecurity(sender: AnyObject) {
        kSecurePassword = !kSecurePassword
        updateUI();
    }
}

