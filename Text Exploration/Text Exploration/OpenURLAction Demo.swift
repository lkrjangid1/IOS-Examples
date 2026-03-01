//
//  OpenURLAction Demo.swift
//  Text Exploration
//
//  Created by Ron Erez on 24/04/2024.
//

import SwiftUI

struct OpenURLAction_Demo: View {
    let fontAwesome = "*[Font awesome](https://fontawesome.com/search?m=free&o=r)*"
    @State private var visits = 0
    let maxVisits = 4  // Should be at least three
    
    var visitMe: String {
        switch(visits) {
        case 0: return "Check out \(fontAwesome) for some great fonts."
        case 1: return "Glad you are using \(fontAwesome)"
        case 2: return "Using \(fontAwesome)? Please leave a review."
        case 3...maxVisits: return "\(fontAwesome)"
        default:
            return "No more font awesome, let's get back to coding"
        }
    }
    
    @State private var actOfKindnessURLFromGoogle = "*[Acts Of Kindness](https://www.google.com/search?q=acts+of+kindness&sca_esv=db5813506fc066f9&tbm=isch&sxsrf=ACQVn08Yywzuskz4UpiwFy34QhLZTTX70w%3A1713944143521&source=hp&biw=2540&bih=1308&ei=T7YoZqvmHauL7NYPu-qn4Ao&iflsig=ANes7DEAAAAAZijEX1Ag0Ju7O0qeHheLt2kK2iT8paQR&oq=acts+&gs_lp=EgNpbWciBWFjdHMgKgIIADIFEAAYgAQyBRAAGIAEMgUQABiABDIFEAAYgAQyBRAAGIAEMgUQABiABDIFEAAYgAQyBRAAGIAEMgUQABiABDIFEAAYgARIohJQAFjVBHAAeACQAQCYAbUBoAGJBaoBAzAuNbgBA8gBAPgBAYoCC2d3cy13aXotaW1nmAIFoAKVBcICBBAjGCfCAggQABiABBixA5gDAJIHAzAuNaAH4xg&sclient=img)*"
    
    @State private var actOfKindnessURL = "*[Another Act of Kindness](https://www.twinkl.co.il/blog/30-kindness-quotes-for-random-acts-of-kindness-day)*"
    
    @State private var showingAlert = false
    
    var body: some View {
        Form {
            Text(LocalizedStringKey(visitMe))
                .environment(\.openURL,
                      OpenURLAction { url in
                    visits += 1
                    return .systemAction
                })
            
            Text(LocalizedStringKey(actOfKindnessURLFromGoogle))
                .environment(\.openURL, OpenURLAction { url in
                    if url.absoluteString.contains("google") {
                        showingAlert = true
                        return .discarded
                    } else {
                        return .systemAction
                    }
                })
                .tint(.red)
            
            Text(LocalizedStringKey(actOfKindnessURL))
                .environment(\.openURL, OpenURLAction { url in
                    if url.absoluteString.count < 12 || url.absoluteString.contains("bit.ly") {
                        print("suspicious email")
                        return .discarded
                    } else if visits < 2 {
                        return .systemAction
                    } else if let url = URL(string: "https://www.udemy.com/course/wholesome-baking-mastering-whole-wheat-cookies") {
                        return .systemAction(url)
                    } else {
                        return .handled
                    }
                })
                .tint(.green)
        }
        .tint(.secondary)
        .bold()
        .foregroundStyle(.blue)
        .font(.title)
        .alert("Google is blocked", isPresented: $showingAlert) {
            Button("Ok", role: .cancel) { }
        }
    }
}

#Preview {
    OpenURLAction_Demo()
}
