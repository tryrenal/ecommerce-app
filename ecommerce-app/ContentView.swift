//
//  ContentView.swift
//  ecommerce-app
//
//  Created by redveloper on 3/11/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var isActive = false
    
    var body: some View {
        VStack {
            Splash()
        }
    }
}

#Preview {
    ContentView()
}
