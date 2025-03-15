//
//  ProductsModel.swift
//  ecommerce-app
//
//  Created by redveloper on 3/15/25.
//

import Foundation

struct ProductsModel: Identifiable, Hashable{
    var id: String
    var title: String
    var brand: String
    var description: String
    var images: [String]
    var sizes: [Int]
    var reviews: [ReviewModel]
    var price: Int
}

struct ReviewModel: Identifiable, Hashable {
    var id: String
    var userName: String
    var image: String
    var review: String
    var rating: Int
}

var sampleProducts: [ProductsModel] = [
    ProductsModel(
        id: "prod001",
        title: "Classic White T-Shirt",
        brand: "Nike",
        description: "A comfortable, soft cotton t-shirt perfect for everyday wear. Available in various sizes and colors.",
        images: ["https://www.wearcomet.com/cdn/shop/files/lateral-min_9f36678c-606b-48b2-9666-f9bc443acf5f.jpg?v=1722936229&width=990", "https://www.wearcomet.com/cdn/shop/files/tiramisu_lateral-min.jpg?v=1722317878&width=990",
                 "https://www.wearcomet.com/cdn/shop/files/lateral-min_e4a5dfba-7d18-49fb-bbdc-6705a0da16e8.jpg?v=1731648689&width=990",
                ],
        sizes: [40, 41, 42, 43],
        reviews: [
            sampleReview, sampleReview
        ],
        price: 1999
    ),
    
    ProductsModel(
        id: "prod002",
        title: "Running Shoes",
        brand: "Adidas",
        description: "Lightweight and breathable running shoes for both men and women. Designed to provide maximum comfort and support.",
        images: ["https://www.wearcomet.com/cdn/shop/files/lateral-min_9f36678c-606b-48b2-9666-f9bc443acf5f.jpg?v=1722936229&width=990", "https://www.wearcomet.com/cdn/shop/files/tiramisu_lateral-min.jpg?v=1722317878&width=990",
                 "https://www.wearcomet.com/cdn/shop/files/lateral-min_e4a5dfba-7d18-49fb-bbdc-6705a0da16e8.jpg?v=1731648689&width=990",
                ],
        sizes: [8, 9, 10, 11, 12],
        reviews: [
            sampleReview
        ],
        price: 7999
    ),
    
    ProductsModel(
        id: "prod003",
        title: "Leather Wallet",
        brand: "Puma",
        description: "Premium leather wallet with multiple card slots and a sleek design. Perfect for both casual and formal occasions.",
        images: ["https://www.wearcomet.com/cdn/shop/files/lateral-min_9f36678c-606b-48b2-9666-f9bc443acf5f.jpg?v=1722936229&width=990", "https://www.wearcomet.com/cdn/shop/files/tiramisu_lateral-min.jpg?v=1722317878&width=990",
                 "https://www.wearcomet.com/cdn/shop/files/lateral-min_e4a5dfba-7d18-49fb-bbdc-6705a0da16e8.jpg?v=1731648689&width=990",
                ],
        sizes: [1], // Only one size for wallet
        reviews: [
            sampleReview
        ],
        price: 4999
    ),
    
    ProductsModel(
        id: "prod004",
        title: "Bluetooth Headphones",
        brand: "Nike",
        description: "Noise-cancelling Bluetooth headphones with superior sound quality and long battery life. Perfect for commuting or at-home listening.",
        images: ["https://www.wearcomet.com/cdn/shop/files/lateral-min_9f36678c-606b-48b2-9666-f9bc443acf5f.jpg?v=1722936229&width=990", "https://www.wearcomet.com/cdn/shop/files/tiramisu_lateral-min.jpg?v=1722317878&width=990",
                 "https://www.wearcomet.com/cdn/shop/files/lateral-min_e4a5dfba-7d18-49fb-bbdc-6705a0da16e8.jpg?v=1731648689&width=990",
                ],
        sizes: [1], // Only one size for headphones
        reviews: [
            sampleReview, sampleReview
        ],
        price: 8999
    )
]

var sampleReview: ReviewModel = .init(id:"abc", userName: "Naveen C", image: "https://static.independent.co.uk/s3fs-public/thumbnails/image/2015/06/06/15/Chris-Pratt.jpg", review: "Amazin sneakers with best quality", rating: 4)

