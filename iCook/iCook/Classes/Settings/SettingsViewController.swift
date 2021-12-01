//
//  SettingsViewController.swift
//  iCook
//
//  Created by Rada Hristova on 30.11.21.
//

import UIKit
import Firebase
import GoogleSignIn

class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Add sign out button
        let signOut = UIButton(frame: CGRect(x: 50, y: 50, width: 100, height: 30))
        signOut.backgroundColor = .red
        signOut.setTitle("Sign Out", for: .normal)
        signOut.center = view.center
        signOut.center.y = view.center.y + 100
        signOut.addTarget(self, action: #selector(self.signOut(_:)), for: .touchUpInside)
        self.view.addSubview(signOut)
    }
    
    @objc func signOut(_ sender: UIButton) {
        GIDSignIn.sharedInstance.signOut()
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        //main.storyboard.init - go back to Login, without the controllers in the back
        //TODO: 
        print("Signed out")
    }

}
