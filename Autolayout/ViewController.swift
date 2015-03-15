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
    var imageLayoutConstraint: NSLayoutConstraint?{
        willSet{
            if let oldConstraint = imageLayoutConstraint {
                view.removeConstraint(oldConstraint);
            }
        }
        didSet{
            if let newConstraint = imageLayoutConstraint{
                view.addConstraint(newConstraint)
            }
        }
    }
    
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
        image = UIImage(named: "Wallpaper-Cars-4");
    }

    @IBAction func login(sender: AnyObject) {
        self.userName = self.loginField.text ?? "";
    }


    @IBAction func toggleSecurity(sender: AnyObject) {
        kSecurePassword = !kSecurePassword
        updateUI();
    }
    
    var image: UIImage? {
        get{
            return self.imgeView.image;
        }
        set{
            self.imgeView.image = newValue;
            if let constrainedView = imgeView{
                if let newImage:UIImage = newValue{
                    let multiplier:CGFloat = newImage.size.width / newImage.size.height
                    imageLayoutConstraint =  NSLayoutConstraint(
                        item: constrainedView,
                        attribute: .Width,
                        relatedBy: .Equal,
                        toItem: constrainedView,
                        attribute: .Height,
                        multiplier: multiplier,
                        constant: 0)
                }else {
                    imageLayoutConstraint = nil;
                }
            }
        }
    }
}

