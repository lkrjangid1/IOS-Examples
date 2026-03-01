//
//  HotkeySectionView.swift
//  Brevis
//
//  Created by Ron Erez on 15/01/2024.
//

import SwiftUI

struct HotkeySectionView: View {
    let hotkeyCategoryName: String
    let hotkeyModels: [HotkeyModel]
    let searchQuery: String
    
    let sectionHeaderFont: Font = Theme.sectionHeaderFont
    let fontWeight: Font.Weight = Theme.fontWeight
    let subtitleColor: Color = Theme.subtitleColor
    
    var filteredHotkeyModels: [HotkeyModel] {
        if searchQuery.count <= 1 {
            return hotkeyModels
        } else {
            return hotkeyModels
                .filter {
                    $0
                        .text
                        .lowercased()
                        .contains(searchQuery.lowercased())
                }
        }
    }
    
    var body: some View {
        if !filteredHotkeyModels.isEmpty {
            Section {
                ForEach(filteredHotkeyModels) { hotkeyModel in
                    HotkeyRow(hotkeyModel: hotkeyModel, searchQuery: searchQuery)
                }
            } header: {
                Text(hotkeyCategoryName)
                    .font(sectionHeaderFont)
                    .fontWeight(fontWeight)
                    .foregroundStyle(subtitleColor)
            }

        }
    }
}

#Preview {
    Form {
        HotkeySectionView(hotkeyCategoryName: "Navigation", hotkeyModels: [
            .init(modifiers: [.command], character: "1", text: "Project"),
            .init(modifiers: [.command], character: "2", text: "Source Control"),
        ], searchQuery: "")
    }
    .frame(minWidth: Theme.frameWidth, minHeight: Theme.frameHeight)
}
