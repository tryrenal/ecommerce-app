//
//  ContentView.swift
//  ecommerce-app
//
//  Created by redveloper on 3/11/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView{
            Home()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(.ultraThickMaterial, for: .tabBar)
                
            
            Text("Search View")
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("Explore")
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(.ultraThickMaterial, for: .tabBar)
                
            
            Text("Cart View")
                .tabItem{
                    Image(systemName: "bag")
                    Text("Cart")
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(.ultraThickMaterial, for: .tabBar)
                
            
            Profile()
                .tabItem{
                    Image(systemName: "person")
                    Text("Profile")
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(.ultraThickMaterial, for: .tabBar)
            
        }
        .tint(.black)
        .navigationBarHidden(true)
    }
     
}

#Preview {
    ContentView()
}
