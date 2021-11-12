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
    let backgroundColor = UIColor(hexaString: "#FCF8E8")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = backgroundColor
        iCookLogo.layer.cornerRadius = 15
        iCookLogo.clipsToBounds = true
        
        appNameLabel.font = UIFont(name: "Palatino-Bold", size: 30)
        descriptionLabel.font = UIFont(name: "Palatino-BoldItalic", size: 30)
        
    }
    
    @IBAction func continuePressed(_ sender: UIButton) {
    
    }
    
    
    
}

extension UIColor {
    convenience init(hexaString: String, alpha: CGFloat = 1) {
        let chars = Array(hexaString.dropFirst())
        self.init(red:   .init(strtoul(String(chars[0...1]),nil,16))/255,
                  green: .init(strtoul(String(chars[2...3]),nil,16))/255,
                  blue:  .init(strtoul(String(chars[4...5]),nil,16))/255,
                  alpha: alpha)}
}
 

