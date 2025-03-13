//
//  Sign-in.swift
//  ecommerce-app
//
//  Created by redveloper on 3/12/25.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

struct Sign_in: View {
    
    @State private var password: String = ""
    @State private var email: String = ""
    
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
                        isLoading = true
                        
                        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                            
                            if error != nil {
                                print(error?.localizedDescription ?? "")
                                withAnimation{
                                    isLoading.toggle()
                                }
                            } else {
                                isSigned = true
                                
                                let db = Firestore.firestore()
                                db.collection("USERS").document(result?.user.uid ?? "").getDocument() { document, error in
                                    
                                    if let document = document, document.exists {
                                        let name = document.get("User_name") as? String ?? ""
                                        let email = document.get("Email") as? String ?? ""
                                        
                                        UserDefaults.standard.set(name, forKey: "NAME")
                                        UserDefaults.standard.set(email, forKey: "EMAIL")
                                        
                                        isLoading.toggle()
                                
                                    }
                                    else {
                                        isLoading.toggle()
                                        print("Document Not Exist")
                                    }
                                }
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
                    NavigationLink{
                        Sign_up()
                    }
                    label: {
                        Text("Not having account? **Signup**")
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.white)
                    }
                })
                
            }
            .padding()
            .preferredColorScheme(.dark)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    Sign_in()
}
