//
//  dogImageFit.swift
//  Liquid Glass Demo
//
//  Created by Ron Erez on 05/07/2025.
//
import SwiftUI

struct DogImageFit: View {
    var body: some View {
        Image(.dogInNature)
            .resizable()
            .scaledToFit()
            .opacity(0.8)
            .ignoresSafeArea()
    }
}


struct DogImageFill: View {
    var body: some View {
        Image(.dogInNature)
            .resizable()
            .scaledToFill()
            .opacity(0.8)
            .ignoresSafeArea()
    }
}
