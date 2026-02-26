//
//  Glass Union Demo.swift
//  Liquid Glass Demo
//
//  Created by Ron Erez on 05/07/2025.
//

import SwiftUI

enum PersonType: String, CaseIterable, Identifiable {
    case male, female, skater, football
    
    var id: String { rawValue }
    
    var color: Color {
        switch self {
        case .male:
                .blue
        case .female:
                .pink
        case .skater:
                .green
        case .football:
                .orange
        }
    }
    
    var systemImage: String {
        switch self {
        case .male:
            "figure.stand"
        case .female:
            "figure.stand.dress"
        case .skater:
            "figure.skateboarding"
        case .football:
            "figure.american.football"
        }
    }
}

struct Glass_Union_Demo: View {
    @Namespace private var personNamespace
    @State private var selectedPerson: PersonType = .male
    
    var body: some View {
        GlassEffectContainer {
            HStack(spacing: 24) {
                ForEach(PersonType.allCases) { person in
                    Button {
                        selectedPerson = person
                    } label: {
                        Image(systemName: person.systemImage)
                            .bold()
                            .foregroundStyle(selectedPerson == person ? person.color : .secondary)
                    }
                    .buttonStyle(.glassProminent)
                    .glassEffectUnion(
                        id: "personOptions",
                        namespace: personNamespace
                    )
                }
            }
            .font(.largeTitle)
        }
        .tint(.indigo.opacity(0.2))
    }
}

#Preview {
    Glass_Union_Demo()
}
