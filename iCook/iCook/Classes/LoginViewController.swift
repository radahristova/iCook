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
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.beigeColor
        
        appNameLabel.configureDefault(withSize: 30)
        descriptionLabel.configureDefault(withSize: 26)
        
        
    }
    
    //MARK: IBActions
    @IBAction func continuePressed(_ sender: UIButton) {
    
    }

}
