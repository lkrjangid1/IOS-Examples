//
//  ContentView.swift
//  Environment Example
//
//  Created by Ron Erez on 02/01/2024.
//

import SwiftUI

@Observable
class PersonViewModel {
    var firstName: String = "Ron"
    var lastName: String = "Erez"
    
    var getName: String {
        "\(firstName) \(lastName)"
    }
    
    func changePerson() {
        let names: [(String,String)] = [
        ("Big", "Bird"),
        ("Elmo", ""),
        ("Cookie", "Monster"),
        ("Oscar", "the Grouch"),
        ("Bert", ""),
        ("Ernie", ""),
        ]
        let randomName: (String, String) = names
            .randomElement() ?? ("","")
        
        firstName = randomName.0
        lastName = randomName.1
    }
}

struct ContentView: View {
    @Environment(PersonViewModel.self) private var personViewModel
    
    var body: some View {
        @Bindable var personViewModel = personViewModel
        
        VStack {
            Text(personViewModel.getName)
            
            TextField("Enter your first name",
                      text: $personViewModel.firstName)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Change Person", action: {
                personViewModel.changePerson()
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(PersonViewModel())
}
