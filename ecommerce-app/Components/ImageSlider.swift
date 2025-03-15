//
//  ImageSlider.swift
//  ecommerce-app
//
//  Created by redveloper on 3/15/25.
//

import SwiftUI

struct ImageSlider: View {
    
    var images: [String]
    
    var body: some View {
        TabView{
            ForEach(images, id: \.self){ img in
                AsyncImage(url: URL(string: img)){ image in
                    image
                        .resizable()
                        .scaledToFill()
                }
                placeholder: {
                    ProgressView()
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}
