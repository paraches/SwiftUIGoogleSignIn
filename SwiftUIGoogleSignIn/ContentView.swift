//
//  ContentView.swift
//  SwiftUIGoogleSignIn
//
//  Created by paraches on 2019/12/23.
//  Copyright © 2019 paraches lifestyle lab. All rights reserved.
//

import SwiftUI
import GoogleSignIn

struct ContentView: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        Group {
            if userData.isSignedIn {
                UserProfileView().environmentObject(userData)
            }
            else {
                GoogleLoginBtn().padding()
            }
        }
    }
}

struct GoogleLoginBtn: UIViewRepresentable {
    @Environment(\.colorScheme) var colorScheme: ColorScheme

    typealias UIViewType = GIDSignInButton
    
    func makeUIView(context: UIViewRepresentableContext<GoogleLoginBtn>) -> GIDSignInButton {
        let button = GIDSignInButton()
        switch colorScheme {
        case .light:
            button.colorScheme = .light
        case .dark:
            button.colorScheme = .dark
        default:
            button.colorScheme = .light
        }
        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.last?.rootViewController
        return button
    }

    func updateUIView(_ uiView: GIDSignInButton, context: UIViewRepresentableContext<GoogleLoginBtn>) {
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserData())
    }
}
