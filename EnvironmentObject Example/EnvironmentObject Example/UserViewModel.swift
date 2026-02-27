//
//  UserViewModel.swift
//  EnvironmentObject Example
//
//  Created by Ron Erez on 02/01/2024.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var name: String = "Ron"
}
