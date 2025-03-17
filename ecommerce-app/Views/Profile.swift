//
//  Profile.swift
//  ecommerce-app
//
//  Created by redveloper on 3/17/25.
//

import SwiftUI
import FirebaseAuth


struct Profile: View {
    @State private var navigatedToLogin: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .center){
                Button{
                    do {
                        try Auth.auth().signOut()
                        navigatedToLogin = true
                    }
                    catch{
                        print(error.localizedDescription)
                    }
                }
                label:{
                    Text("Sign Out")
                        .font(.callout)
                }
                .navigationDestination(isPresented: $navigatedToLogin){
                    Sign_in()
                }
            }
        }
    }
}

#Preview {
    Profile()
}
