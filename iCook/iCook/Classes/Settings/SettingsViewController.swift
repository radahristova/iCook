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
    @IBOutlet weak var fullNameLabel: ICLabel!
    @IBOutlet weak var userAccountPhotoImageView: UIImageView!
    
    //MARK: Variables
    var userProfile: GIDProfileData?

    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSignOutButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        userProfile = UserDefaults.getUserProfile()

        configureGooglePhoto()
        
        if let firstName = userProfile?.givenName,
           let lastName = userProfile?.familyName {
            fullNameLabel.configureDefault(withSize: 20)
            fullNameLabel.text = "\(firstName) \(lastName)"
        }
    }
    
    //MARK: Util Methods
    private func configureGooglePhoto(){
        let pic = userProfile?.imageURL(withDimension: 300)
        userAccountPhotoImageView.kf.setImage(with: pic)
        
        userAccountPhotoImageView.clipsToBounds = true
        userAccountPhotoImageView.layer.cornerRadius = userAccountPhotoImageView.frame.size.width / 2
    }
    
    private func addSignOutButton() {
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
        
        let alertVC = UIAlertController(title: "Logout", message: "Are you sure?", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "No", style: .cancel, handler: {_ in return}))
        alertVC.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { [weak self] _ in
            HUD.flash(.success, delay: 0.3)
            UserDefaults.deleteUserProfile()
            self?.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        }))
        present(alertVC, animated: true, completion: nil)
    }
    
}
