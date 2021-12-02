//
//  UserDefaults+Favourites.swift
//  iCook
//
//  Created by Rada Hristova on 23.11.21.
//

import Foundation
import GoogleSignIn

private enum UserDefaultsKeys: String {
    case userProfileData = "UserProfileData"
}

extension UserDefaults {
    
    static func saveUserProfile(_ userProfileData: GIDProfileData) {
        let encodedUserProfileData = try? NSKeyedArchiver.archivedData(withRootObject: userProfileData, requiringSecureCoding: false)
        standard.set(encodedUserProfileData, forKey: UserDefaultsKeys.userProfileData.rawValue)
    }
    
    static func getUserProfile() -> GIDProfileData? {
        let decodedUserProfileData = UserDefaults.standard.object(forKey: UserDefaultsKeys.userProfileData.rawValue) as! Data
        let userProfileData = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(decodedUserProfileData) as? GIDProfileData
        return userProfileData
    }
    
    static func deleteUserProfile() {
        //TODO: delete
     UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.userProfileData.rawValue)
    }
    
}
