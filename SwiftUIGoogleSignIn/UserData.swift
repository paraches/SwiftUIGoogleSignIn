//
//  UserData.swift
//  SwiftUIGoogleSignIn
//
//  Created by paraches on 2019/12/23.
//  Copyright © 2019 paraches lifestyle lab. All rights reserved.
//

import Foundation
import GoogleSignIn

class UserData: NSObject, ObservableObject, GIDSignInDelegate {
    @Published var user: GIDGoogleUser?
    
    var isSignedIn: Bool {
        return user != nil
    }
    
    override init() {
        super.init()
        GIDSignIn.sharedInstance()?.delegate = self
    }

    //
    //
    //
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        return (GIDSignIn.sharedInstance()?.handle(url))!
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            }
            else {
                print("\(error.localizedDescription)")
            }
            return
        }

        self.user = user
    }

    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        print("Disconnect user :\(String(describing: user.profile.name))")

        self.user = nil
    }

}
