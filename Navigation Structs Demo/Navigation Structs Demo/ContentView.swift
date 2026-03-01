//
//  ContentView.swift
//  Navigation Structs Demo
//
//  Created by Ron Erez on 07/10/2025.
//

import SwiftUI

struct Product: Identifiable, Hashable {
    let id = UUID()
    
    let name: String
    let price: Double
}

struct ContentView: View {
    let products: [Product] = [
        .init(name: "iPhone", price: 999),
        .init(name: "MacBook", price: 1999.23),
        .init(name: "iPad", price: 599),
    ]
    var body: some View {
        NavigationStack {
            List(products) { product in
                NavigationLink(value: product) {
                    Text(product.name)
                        .bold()
                        .foregroundStyle(product.price < 1000 ? .blue : .red)
                }
            }
            .navigationDestination(for: Product.self) { product in
                VStack {
                    Text(product.name)
                        .font(.largeTitle)
                    Text("Price: $\(product.price.formatted())")
                }
            }
            .navigationTitle("Products")
        }
    }
}

#Preview {
    ContentView()
}
