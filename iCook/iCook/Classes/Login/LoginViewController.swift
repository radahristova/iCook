//
//  ViewController.swift
//  iCook
//
//  Created by Rada Hristova on 12.11.21.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginViewController: ICViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var iCookLogo: ICRoundedImageView!
    @IBOutlet weak var appNameLabel: ICLabel!
    @IBOutlet weak var descriptionLabel: ICLabel!
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appNameLabel.configureDefault(withSize: 30)
        descriptionLabel.configureDefault(withSize: 26)
        //TODO: Check if has a previous login
        checkIfAlreadyLoggedIn()
        //TODO: Separate method 
    }
    
    //MARK: IBActions
    @IBAction func continuePressed(_ sender: UIButton!) {
        let tabBar = ICTabBarController()
        tabBar.selectedIndex = 1
        present(tabBar, animated: true, completion: nil)
    }
    
    @IBAction func didTouchUpInside(_ button: GIDSignInButton) {
        googleSignIn()
    }
    
    @objc private func googleSignIn() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            
            fireBaseLogin(with: credential)
        }
    }
    
    private func checkIfAlreadyLoggedIn() {
        if(GIDSignIn.sharedInstance.currentUser != nil)
        {
        //loggedIn
        }
        else
        {
        //not loggedIn
        }
    }
    
    private func fireBaseLogin(with credential: AuthCredential) {
        Auth.auth().signIn(with: credential) { [weak self] authResult, error in
            if let error = error {
                self?.mfa(error: error)
            }
            else {
                //Initialize tab bar controller
                let tabBar = ICTabBarController()
                tabBar.selectedIndex = 1
                self?.present(tabBar, animated: true, completion: nil)
            }
        }
    }
    
    private func mfa(error: Error) {

    }
    
}
