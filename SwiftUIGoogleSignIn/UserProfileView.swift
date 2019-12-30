//
//  UserProfileView.swift
//  SwiftUIGoogleSignIn
//
//  Created by paraches on 2019/12/25.
//  Copyright © 2019 paraches lifestyle lab. All rights reserved.
//

import SwiftUI

struct UserProfileView: View {
    @EnvironmentObject var user: UserData
    
    var body: some View {
        VStack {
            Text("\((user.user?.profile.name)!)")
            Text("\((user.user?.profile.email)!)")
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
