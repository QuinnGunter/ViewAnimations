//
//  ViewController.swift
//  Project 5.1 View Animations
//
//  Created by Quintin Gunter on 5/24/17.
//  Copyright © 2017 Quintin Gunter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Blurr
    @IBOutlet weak var blurPhotoView: UIVisualEffectView!
    @IBOutlet weak var welcomText: UIVisualEffectView!
    
    //Login Label
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var loginLabelTop: NSLayoutConstraint!
    
    //Name Text Field
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameFieldTrailing: NSLayoutConstraint!
    @IBOutlet weak var nameFieldLeading: NSLayoutConstraint!
    
    //Email Text Field
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailFieldTrailing: NSLayoutConstraint!
    @IBOutlet weak var emailFieldLeading: NSLayoutConstraint!
    
    override func viewWillAppear(_ animated: Bool) {
        //Login
        loginLabelTop.constant = -view.bounds.height
        
        //Name Field Off Screen
        nameFieldLeading.constant = view.bounds.width
        nameFieldTrailing.constant = -view.bounds.width
        
        //Email Field off screen
        emailFieldLeading.constant = -view.bounds.width
        emailFieldTrailing.constant = view.bounds.width
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //Blur
        UIView.animate(withDuration: 2) {
            self.blurPhotoView.alpha = 1
        }
        
        //Login Spring top
        UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 1, initialSpringVelocity: 15, options: [], animations: {
            self.loginLabelTop.constant = 180
            self.view.layoutIfNeeded()
        })
        
        //Name Spring in
        UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 15, options: [], animations: {
            self.nameFieldLeading.constant  = 16
            self.nameFieldTrailing.constant = 16
            self.view.layoutIfNeeded()
        }, completion: { _ in
            self.nameTextField.becomeFirstResponder()
        })
        
        //Email Spring in
        UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 15, options: [], animations: {
            self.emailFieldLeading.constant  = 16
            self.emailFieldTrailing.constant = 16
            self.view.layoutIfNeeded()
        }, completion: { _ in
            self.emailTextField.becomeFirstResponder()
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

