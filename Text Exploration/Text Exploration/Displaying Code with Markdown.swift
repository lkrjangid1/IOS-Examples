//
//  Displaying Code with Markdown.swift
//  Text Exploration
//
//  Created by Ron Erez on 24/04/2024.
//

import SwiftUI

struct Displaying_Code_with_Markdown: View {
    let codeString = """
**A Swift View**

`import SwiftUI`

`struct Displaying_Code_with_Markdown: View {`
    `var body: some View {`
        `Text("Hello, World!")`
    `}`
`}`

`#Preview {`
    `Displaying_Code_with_Markdown()`
`}`
"""
    var body: some View {
        Text(LocalizedStringKey(codeString))
            .padding()
    }
}

#Preview {
    Displaying_Code_with_Markdown()
}
