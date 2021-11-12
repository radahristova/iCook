//
//  ViewController.swift
//  iCook
//
//  Created by Rada Hristova on 12.11.21.
//

import UIKit

class LoginViewController: ICViewController {
    
    @IBOutlet weak var iCookLogo: UIImageView!
    
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        iCookLogo.layer.cornerRadius = 15
        iCookLogo.clipsToBounds = true
        
    }
    
    @IBAction func continuePressed(_ sender: UIButton) {
        
    }
    
}

