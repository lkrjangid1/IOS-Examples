//
//  KeySymbolView.swift
//  Brevis
//
//  Created by Ron Erez on 15/01/2024.
//

import SwiftUI

struct KeySymbolView: View {
    var body: some View {
        let midIndex = Modifier.allCases.count / 2 + 1
        
        HStack(alignment: .top) {
            KeySymbolViewColumn(lowerIndex: 0, upperIndex: midIndex)
            
            KeySymbolViewColumn(lowerIndex: midIndex, upperIndex: Modifier.allCases.count)
        }
    }
}

struct KeySymbolViewColumn: View {
    let lowerIndex: Int
    let upperIndex: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(lowerIndex..<upperIndex, id: \.self) { i in
                KeyValueRow( modifer: Modifier.allCases[i])
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct KeyValueRow: View {
    let modifer: Modifier
    
    let modifierFont: Font = Theme.modiferFont
    
    var body: some View {
        Text("\(modifer.rawValue) = \(modifer.description)")
            .font(modifierFont)
    }
}

#Preview {
    KeySymbolView()
}



