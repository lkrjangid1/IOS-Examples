//
//  HotkeyCategoryModel.swift
//  Brevis
//
//  Created by Ron Erez on 15/01/2024.
//

import Foundation

struct HotkeyCategoryModel: Identifiable {
    let id = UUID()
    
    let name: String
    let hotkeyModels: [HotkeyModel]
}
