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

class SettingsViewController: UIViewController {
    
    var userProfile: GIDProfileData?
    
    @IBOutlet weak var userFirstName: UILabel!
    
    @IBOutlet weak var userLastName: UILabel!
    @IBOutlet weak var userAccountPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSignOutButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        userProfile = UserDefaults.getUserProfile()

        showGooglePhoto()
        
        userFirstName.text = userProfile?.givenName
        userLastName.text = userProfile?.familyName
    }
    
    private func showGooglePhoto(){
        let pic = userProfile?.imageURL(withDimension: 300)
        userAccountPhoto.kf.setImage(with: pic)
        
        userAccountPhoto.clipsToBounds = true
        userAccountPhoto.layer.cornerRadius = userAccountPhoto.frame.size.width / 2
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
