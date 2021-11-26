//
//  ViewController.swift
//  iCook
//
//  Created by Rada Hristova on 12.11.21.
//

import UIKit

class LoginViewController: ICViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var iCookLogo: ICRoundedImageView!
    @IBOutlet weak var appNameLabel: ICLabel!
    @IBOutlet weak var descriptionLabel: ICLabel!
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        appNameLabel.configureDefault(withSize: 30)
        descriptionLabel.configureDefault(withSize: 26)
    }
    
    //MARK: IBActions
    @IBAction func continuePressed(_ sender: UIButton!) {
        let tabBar = ICTabBarController()
        tabBar.selectedIndex = 1
        present(tabBar, animated: true, completion: nil)
    }
    
    func googleSignIn() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in

          if let error = error {
            // ...
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

          // ...
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                  let authError = error as NSError
                  if isMFAEnabled, authError.code == AuthErrorCode.secondFactorRequired.rawValue {
                    // The user is a multi-factor user. Second factor challenge is required.
                    let resolver = authError
                      .userInfo[AuthErrorUserInfoMultiFactorResolverKey] as! MultiFactorResolver
                    var displayNameString = ""
                    for tmpFactorInfo in resolver.hints {
                      displayNameString += tmpFactorInfo.displayName ?? ""
                      displayNameString += " "
                    }
                    self.showTextInputPrompt(
                      withMessage: "Select factor to sign in\n\(displayNameString)",
                      completionBlock: { userPressedOK, displayName in
                        var selectedHint: PhoneMultiFactorInfo?
                        for tmpFactorInfo in resolver.hints {
                          if displayName == tmpFactorInfo.displayName {
                            selectedHint = tmpFactorInfo as? PhoneMultiFactorInfo
                          }
                        }
                        PhoneAuthProvider.provider()
                          .verifyPhoneNumber(with: selectedHint!, uiDelegate: nil,
                                             multiFactorSession: resolver
                                               .session) { verificationID, error in
                            if error != nil {
                              print(
                                "Multi factor start sign in failed. Error: \(error.debugDescription)"
                              )
                            } else {
                              self.showTextInputPrompt(
                                withMessage: "Verification code for \(selectedHint?.displayName ?? "")",
                                completionBlock: { userPressedOK, verificationCode in
                                  let credential: PhoneAuthCredential? = PhoneAuthProvider.provider()
                                    .credential(withVerificationID: verificationID!,
                                                verificationCode: verificationCode!)
                                  let assertion: MultiFactorAssertion? = PhoneMultiFactorGenerator
                                    .assertion(with: credential!)
                                  resolver.resolveSignIn(with: assertion!) { authResult, error in
                                    if error != nil {
                                      print(
                                        "Multi factor finanlize sign in failed. Error: \(error.debugDescription)"
                                      )
                                    } else {
                                      self.navigationController?.popViewController(animated: true)
                                    }
                                  }
                                }
                              )
                            }
                          }
                      }
                    )
                  } else {
                    self.showMessagePrompt(error.localizedDescription)
                    return
                  }
                  // ...
                  return
                }
                // User is signed in
                // ...
            }
        }
    }
}
