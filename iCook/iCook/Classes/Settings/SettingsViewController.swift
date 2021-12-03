//
//  SettingsViewController.swift
//  iCook
//
//  Created by Rada Hristova on 30.11.21.
//

import UIKit
import Firebase
import GoogleSignIn
import PKHUD
import Kingfisher

class SettingsViewController: ICViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var userInformationShadowView: ICShadowView!
    @IBOutlet weak var fullNameLabel: ICLabel!
    @IBOutlet weak var userAccountPhotoImageView: UIImageView!
    @IBOutlet weak var signOutButton: ICButton!
    
    //MARK: Variables
    private var userProfile: GIDProfileData?
    private var hasLoggedInUser: Bool?
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signOutButton.configureForSignOut()
        signOutButton.addTarget(self, action: #selector(self.signOut(_:)), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        userProfile = UserDefaults.getUserProfile()
        hasLoggedInUser = userProfile != nil ? true : false
        
        configureStyle()
    }
    
    //MARK: Util Methods
    private func configureStyle() {
        if hasLoggedInUser == true {
            userInformationShadowView.isHidden = false

            configureGooglePhoto()
            
            if let firstName = userProfile?.givenName,
               let lastName = userProfile?.familyName {
                fullNameLabel.configureDefault(withSize: 20)
                fullNameLabel.text = "\(firstName) \(lastName)"
            }
            signOutButton.setTitle("Sign Out", for: .normal)
            
        } else {
            userInformationShadowView.isHidden = true
            signOutButton.setTitle("Go To Login", for: .normal)
        }
    }
    
    private func configureGooglePhoto(){
        let pic = userProfile?.imageURL(withDimension: 300)
        userAccountPhotoImageView.kf.setImage(with: pic)
        
        userAccountPhotoImageView.clipsToBounds = true
        userAccountPhotoImageView.layer.cornerRadius = userAccountPhotoImageView.frame.size.width / 2
    }
    
    @objc private func signOut(_ sender: UIButton) {
        GIDSignIn.sharedInstance.signOut()
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        
        var alertVC: UIAlertController?
        if hasLoggedInUser == true{
            alertVC = UIAlertController(title: "Sign Out", message: "Are you sure?", preferredStyle: .alert)
        } else {
            alertVC = UIAlertController(title: "Go to login", message: "Are you sure?", preferredStyle: .alert)
        }
        alertVC?.addAction(UIAlertAction(title: "No", style: .cancel, handler: {_ in return}))
        alertVC?.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { [weak self] _ in
            HUD.flash(.success, delay: 0.3)
            UserDefaults.deleteUserProfile()
            self?.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        }))
        present(alertVC!, animated: true, completion: nil)
    }
    
}
