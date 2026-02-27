//
//  AddressView.swift
//  Bindable Example
//
//  Created by Ron Erez on 03/01/2024.
//

import SwiftUI

@Observable
class Address: Identifiable {
    var street: String
    var city: String
    var state: String
    var postalCode: Int
    var country: String
    
    init(
        street: String = "\((1..<300).randomElement() ?? 1) Main St",
        city: String = "Cityville",
        state: String = "Some State",
        postalCode: Int = 12345,
        country: String = "USA") {
        self.street = street
        self.city = city
        self.state = state
        self.postalCode = postalCode
        self.country = country
    }
}

struct AddressView: View {
    @State var addresses = [Address(), Address(), Address()]
    
    var body: some View {
        List(addresses) { address in
            @Bindable var address = address
            
            TextField(address.street, text: $address.street)
        }
    }
}

#Preview {
    AddressView()
}
