//
//  BrandsModel.swift
//  ecommerce-app
//
//  Created by redveloper on 3/14/25.
//

import Foundation

struct BrandsModel: Identifiable, Hashable{
    var id: UUID = .init()
    var title: String
    var icon: String
}

var sampleBrands: [BrandsModel] = [
    .init(title: "All", icon: ""),
    .init(title: "Nike", icon: "nike"),
    .init(title: "Adidas", icon: "adidas"),
    .init(title: "Puma", icon: "puma")
    
]
