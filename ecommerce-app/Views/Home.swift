//
//  Home.swift
//  ecommerce-app
//
//  Created by redveloper on 3/15/25.
//

import SwiftUI

struct Home: View {
    @State var currentCategory = "All"
    @State var productList = sampleProducts
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 20, content: {
                    HStack{
                        Text("**Shoes**\nCollection")
                            .font(.largeTitle)
                        
                        Spacer()
                        
                        Image(systemName: "bell")
                            .padding(.vertical, 25)
                            .padding(.horizontal, 16)
                            .imageScale(.large)
                            .overlay{
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.black.opacity(0.05), lineWidth: 3)
                            }
                    }
                    
                    categoriesView
                        .zIndex(1)
                    
                    productsView
                        .zIndex(0)
                })
                .padding()
            }
            .scrollIndicators(.hidden)
        }
    }
    
    var categoriesView: some View{
        ScrollView(.horizontal){
            HStack(spacing: 15, content: {
                ForEach(sampleBrands, id: \.id){ item in
                    HStack{
                        if !item.icon.isEmpty{
                            Image(item.icon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 26, height: 26)
                        }
                        
                        if currentCategory == item.title || item.title == "All" {
                            Text(item.title)
                        }
                    }
                    .foregroundStyle(currentCategory == item.title ? .white : .black)
                    .padding()
                    .background( currentCategory == item.title ? .black : .gray.opacity(0.08))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation{
                            currentCategory = item.title
                            
                            if item.title == "All" {
                                productList = sampleProducts
                            }
                            else {
                                productList = sampleProducts.filter {
                                    $0.brand == item.title
                                }
                            }
                        }
                    }
                }
            })
        }
    }
    
    var productsView: some View {
        VStack{
            ForEach(productList, id: \.id){ item in
                VStack{
                    AsyncImage(url: URL(string: item.images[0])) { img in
                        img.resizable()
                            .scaledToFill()
                    }
                    placeholder: {
                        ProgressView()
                    }
                    .frame(width: UIScreen.main.bounds.width - 40 , height: 200)
                    .clipShape(Rectangle())
                    
                    Text(item.title)
                        .font(.headline.bold())
                    
                    Text("$\(item.price)")
                        .font(.callout)
                    
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
