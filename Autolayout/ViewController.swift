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
    @IBOutlet weak var imgeView: UIImageView!
    
    var kSecurePassword:Bool = true;
    var userName: String? {
        didSet{
            updateUI();
        }
    };
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateUI();
    }
    
    func updateUI() {
        passwordField.secureTextEntry = kSecurePassword;
        passwordLabel.text = passwordField.secureTextEntry ? "Secure Password" : "Password";
    }

    @IBAction func login(sender: AnyObject) {
        self.userName = self.loginField.text ?? "";
    }


    @IBAction func toggleSecurity(sender: AnyObject) {
        kSecurePassword = !kSecurePassword
        updateUI();
    }
}

