//
//  Product.swift
//  ecommerce-app
//
//  Created by redveloper on 3/15/25.
//

import SwiftUI

struct Product: View {
    var data: ProductsModel
    @State var selectedSize = 40

    @Environment(\.presentationMode) var dismiss
    
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView{
                    VStack{
                        ZStack(alignment: .top) {
                            ImageSlider(images: data.images)
                                .frame(height: 400)
                                .clipShape(RoundedRectangle(cornerRadius: 50))
                                .padding(10)
                            
                            HStack{
                                Image(systemName: "arrow.left")
                                    .onTapGesture {
                                        dismiss.wrappedValue.dismiss()
                                    }
                                Spacer()
                                Image(systemName: "heart")
                            }
                            .padding(.top, safeArea().top)
                            .padding()
                            .imageScale(.large)
                        }
                        
                        Image(data.brand.lowercased())
                        
                        Text(data.title)
                            .font(.largeTitle.bold())

                        Text("$\(data.price)")
                            .font(.title.bold())
                        
                        VStack(alignment: .leading){
                            Text("Size")
                                .font(.title2.bold())
                            
                            ScrollView(.horizontal){
                                HStack{
                                    ForEach(data.sizes, id: \.self){ item in
                                        Text("\(item)")
                                            .font(.headline)
                                            .frame(width: 70, height: 70)
                                            .background(selectedSize == item ? .black : .gray.opacity(0.06))
                                            .foregroundStyle(selectedSize == item ? .white : .black)
                                            .clipShape(RoundedRectangle(cornerRadius: 30))
                                            .onTapGesture(perform: {
                                                selectedSize = item
                                            })
                                    }
                                }
                            }
                            .scrollIndicators(.hidden)
                        }
                        .padding()
                        
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Details")
                                .font(.title2.bold())
                            
                            Text(data.description)
                                .multilineTextAlignment(.leading)
                        }
                        .padding()
                    }
                }
                
                HStack{
                    VStack(alignment: .leading){
                        Text("$\(data.price)")
                            .font(.title2.bold())
                    }
                    .frame(width: UIScreen.main.bounds.width / 2.5, height: 60)
                    .background(.gray.opacity(0.06))
                    .clipShape(.rect(cornerRadius: 25))
                    
                    Button("Add to Cart"){
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(.black)
                    .clipShape(.rect(cornerRadius: 25))
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                }
                .padding(.horizontal)
            }
            .edgesIgnoringSafeArea(.top)
        }
        .scrollIndicators(.hidden)
    }
}

extension View {
    func safeArea() -> UIEdgeInsets{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return .zero }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        
        return safeArea
    }
}
