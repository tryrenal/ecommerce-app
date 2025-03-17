//
//  Sign-up.swift
//  ecommerce-app
//
//  Created by redveloper on 3/13/25.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore
import FirebaseStorage
import FirebaseFirestore

struct Sign_up: View {
    
    @State private var password: String = ""
    @State private var email: String = ""
    @State private var userName: String = ""
    
    @State private var isLoading = false
    @State private var isSigned = false
    
    @Environment(\.presentationMode) var dismiss
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 40){
                Image(systemName: "arrow.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss.wrappedValue.dismiss()
                    }
                
                VStack(alignment: .leading, spacing: 15, content: {
                    Text("Sign-up")
                        .font(.title)
                    
                    Text("Enter your email address and password and continue shopping.")
                        .font(.callout)
                })
                
                VStack(spacing: 15, content:{
                    TextField("User name", text: $userName)
                        .frame(height: 60)
                        .padding(.horizontal)
                        .background(.gray.opacity(0.2))
                        .clipShape(Capsule())
                        .overlay(content: {
                            Capsule()
                                .stroke(.gray.opacity(0.8),lineWidth: 0.5)
                        })
                    
                    TextField("Email Address", text: $email)
                        .frame(height: 60)
                        .padding(.horizontal)
                        .background(.gray.opacity(0.2))
                        .clipShape(Capsule())
                        .overlay(content: {
                            Capsule()
                                .stroke(.gray.opacity(0.8),lineWidth: 0.5)
                        })
                    
                    SecureField("Password", text: $password)
                        .frame(height: 60)
                        .padding(.horizontal)
                        .background(.gray.opacity(0.2))
                        .clipShape(Capsule())
                        .disableAutocorrection(false)
                        .autocapitalization(.none)
                        .overlay(content: {
                            Capsule()
                                .stroke(.gray.opacity(0.8),lineWidth: 0.5)
                        })
                    
                })
                
                Spacer()
            
                VStack(spacing: 15, content: {
                    Button {
                        isLoading.toggle()
                        Auth.auth().createUser(withEmail: email, password: password){
                            (result, error) in
                            isLoading.toggle()
                            
                            if error != nil {
                                print(error?.localizedDescription ?? "")
                                withAnimation{
                                    isLoading.toggle()
                                }
                            }
                            else {
                                let db = Firestore.firestore()
                                let data: [String: Any] = [
                                    "User_name": userName,
                                    "Email": email,
                                ]
                                
                                UserDefaults.standard.setValue(result?.user.uid, forKey: "UID")
                                UserDefaults.standard.setValue(userName, forKey: "NAME")
                                UserDefaults.standard.setValue(email, forKey: "EMAIL")
                            
                                db.collection("USERS").addDocument(data: data)
                                isLoading.toggle()
                                
                                isSigned = true
                            }
                        }
                    }
                    label: {
                        if isLoading {
                            ProgressView()
                        }
                        else {
                            Text("Continue")
                                .fontWeight(.semibold)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(.red)
                    .foregroundStyle(.white)
                    .clipShape(Capsule())
                    .navigationDestination(isPresented: $isSigned){
                        ContentView()
                    }
                    
                    NavigationLink {
                        Sign_in()
                    }
                    label: {
                        Text("Already have an account? **Signin**")
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.black)
                    }
                    
                })
                
            }
            .padding()
        }
        .navigationBarHidden(true)
        
    }
}

#Preview {
    Sign_up()
}
