//
//  Splash.swift
//  ecommerce-app
//
//  Created by redveloper on 3/11/25.
//

import SwiftUI

struct Splash: View {
    
    @State var isActive = false
    
    var body: some View {
        VStack{
            if isActive == true {
                Onboarding()
            }
            else {
                Text("NIKE")
                    .font(.largeTitle.bold())
            }
        }.onAppear(){
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
                withAnimation{
                    isActive = true
                }
            }
        }
        
    }
}

#Preview {
    Splash()
}
