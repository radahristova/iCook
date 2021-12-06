//
//  ViewController.swift
//  iCook
//
//  Created by Rada Hristova on 12.11.21.
//

import UIKit
import Firebase
import GoogleSignIn
import simd

class LoginViewController: ICViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var iCookLogo: ICRoundedImageView!
    @IBOutlet weak var appNameLabel: ICLabel!
    @IBOutlet weak var descriptionLabel: ICLabel!
    @IBOutlet weak var continueWithoutLoginButton: ICButton!
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appNameLabel.configureDefault(withSize: 30)
        descriptionLabel.configureDefault(withSize: 26)
        continueWithoutLoginButton.setTitle("Continue Without Login", for: .normal)
        continueWithoutLoginButton.configureContinueWithoutLogin()
        continueWithoutLoginButton.addBorder()
        checkIfAlreadyLoggedIn()
        
    }
    
    //MARK: IBActions
    @IBAction func didPressContinueWithoutLogin(_ sender: ICButton!) {
        UserDefaults.deleteUserProfile()
        openApp()
    }
    
    @IBAction func didTouchUpInside(_ button: GIDSignInButton) {
        googleSignIn()
    }
    
    
    //MARK: Util Methods
    @objc private func googleSignIn() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        
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
            
            if let userProfileData = user?.profile {
                UserDefaults.saveUserProfile(userProfileData)
            }
            fireBaseLogin(with: credential)
        }
    }
    
    private func checkIfAlreadyLoggedIn() {
        if(GIDSignIn.sharedInstance.currentUser != nil) {
            openApp()
        } else {
        //not loggedIn
        }
    }
    
    private func fireBaseLogin(with credential: AuthCredential) {
        Auth.auth().signIn(with: credential) { [weak self] authResult, error in
            if let error = error {
                print(error)
            }
            else {
                self?.openApp()
            }
        }
    }
    
    private func openApp() {
        let tabBar = ICTabBarController()
        tabBar.selectedIndex = 1
        present(tabBar, animated: true, completion: nil)
    }
    
}
