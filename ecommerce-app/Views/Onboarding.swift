//
//  Onboarding.swift
//  ecommerce-app
//
//  Created by redveloper on 3/11/25.
//

import SwiftUI

struct Onboarding: View {
    
    @State private var isActive = false
    @State private var isExpanded = false
    @State private var offset = CGSize.zero
    
    var body: some View {
        if isActive { 
            Sign_in()
        }
        else {
            ZStack(alignment: .top){
                VStack{
                    Spacer()
                    
                    Circle()
                        .fill(
                            RadialGradient(colors: [.red, .clear, .clear, .clear], center: .center, startRadius: 0, endRadius: UIScreen.main.bounds.width)
                        )
                        .scaleEffect(isExpanded ? 20 :0)
                        .padding(.bottom, -(UIScreen.main.bounds.width / 2))
                }
                .frame(maxHeight: .infinity)
                .zIndex(isExpanded ? 2:0)
                
                VStack(spacing: 15){
                    Spacer()
                    
                    Image("shoes-nike")
                        .resizable()
                        .scaledToFit()
                    
                    Text("Start Journey\nwith NIKE")
                        .font(.largeTitle.bold())
                        .multilineTextAlignment(.center)
                    
                    Text("Smart gorgeous and fashionabe collection makes you cool")
                        .multilineTextAlignment(.center)
                        .opacity(0.6)
                    
                    Spacer()
                    
                    VStack{
                        Image(systemName: "chevron.up")
                        
                        Text("Get Started")
                            .padding(.top)
                    }
                    .fontWeight(.medium)
                }
                .opacity(isExpanded ? 0:1)
                .offset(offset)
            }
            .gesture(DragGesture()
                .onEnded({ value in
                    if value.translation.height < 50 {
                        withAnimation(.easeInOut(duration: 2)){
                            offset = value.translation
                            isExpanded = true
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                            withAnimation{
                                isActive.toggle()
                            }
                        }
                    }
                }))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(){
                Image("onboarding-bg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }
            .preferredColorScheme(.dark)
        }
        
    }
}

#Preview {
    Onboarding()
}
