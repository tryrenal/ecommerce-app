//
//  Sign-in.swift
//  ecommerce-app
//
//  Created by redveloper on 3/12/25.
//

import SwiftUI

struct Sign_in: View {
    
    @State private var password: String = ""
    @State private var email: String = ""
    
    @Environment(\.presentationMode) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 40){
            Image(systemName: "arrow.left")
                .imageScale(.large)
                .onTapGesture {
                    dismiss.wrappedValue.dismiss()
                }
            
            VStack(alignment: .leading, spacing: 15, content: {
                Text("Sign-in")
                    .font(.title)
                
                Text("Enter your email address and password and continue shopping.")
                    .font(.callout)
            })
            
            VStack(spacing: 15, content:{
                TextField("Email Address", text: $email)
                    .frame(height: 60)
                    .padding(.horizontal)
                    .background(.gray.opacity(0.2))
                    .clipShape(Capsule())
                    .overlay(content: {
                        Capsule()
                            .stroke(.gray.opacity(0.8),lineWidth: 0.5)
                    })
                
                TextField("Password", text: $password)
                    .frame(height: 60)
                    .padding(.horizontal)
                    .background(.gray.opacity(0.2))
                    .clipShape(Capsule())
                    .overlay(content: {
                        Capsule()
                            .stroke(.gray.opacity(0.8),lineWidth: 0.5)
                    })
                
            })
            
            Spacer()
        
            VStack(spacing: 15, content: {
                Button {
                    
                }
                label: {
                    Text("Continue")
                }
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(.red)
                .foregroundStyle(.white)
                .clipShape(Capsule())
                
                NavigationLink{
                    Sign_up()
                }
                label: {
                    Text("Not having account? **Signup**")
                        .frame(maxWidth: .infinity)
                }
                .foregroundStyle(.white)
                
                
            })
            
        }
        .padding()
        .preferredColorScheme(.dark)
        .navigationBarHidden(true)
    }
}

#Preview {
    Sign_in()
}
