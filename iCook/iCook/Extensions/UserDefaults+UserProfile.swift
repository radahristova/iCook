//
//  UserDefaults+Favourites.swift
//  iCook
//
//  Created by Rada Hristova on 23.11.21.
//

import Foundation
import GoogleSignIn
import UIKit

enum UserDefaultsKeys: String {
    case userProfileData = "UserProfileData"
    case themeStyle = "themeStyle"
    case chosenTheme = "chosenTheme"
}

extension UserDefaults {
    
    static func saveUserProfile(_ userProfileData: GIDProfileData) {
        let encodedUserProfileData = try? NSKeyedArchiver.archivedData(withRootObject: userProfileData, requiringSecureCoding: false)
        standard.set(encodedUserProfileData, forKey: UserDefaultsKeys.userProfileData.rawValue)
    }
    
    static func getUserProfile() -> GIDProfileData? {
        if let decodedUserProfileData = UserDefaults.standard.object(forKey: UserDefaultsKeys.userProfileData.rawValue) as? Data {
            let userProfileData = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(decodedUserProfileData) as? GIDProfileData
            return userProfileData
        } else {
            return nil
        }
    }
    
    static func deleteUserProfile() {
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.userProfileData.rawValue)
        
    }
    
    static var standardThemeStyle: UIUserInterfaceStyle {
        set {
            standard.themeStyle = newValue
        }
        get {
            standard.themeStyle
        }
    }
    
    var themeStyle: UIUserInterfaceStyle {
        set {
            set(newValue.rawValue, forKey: UserDefaultsKeys.themeStyle.rawValue)
        }
        get {
            if let rawValue = value(forKey: UserDefaultsKeys.themeStyle.rawValue) as? Int,
               let style = UIUserInterfaceStyle(rawValue: rawValue) {
                return style
            }
            return .unspecified
        }
    }
    
}
