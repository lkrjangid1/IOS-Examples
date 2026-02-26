
import SwiftUI

struct User_Info_View: View {
    let name: String
    let email: String
    let phone: String
    let address: String
    var body: some View {
        GroupBox {
            VStack(alignment: .leading) {
                Text("Name: \(name)")
                Text("Email: \(email)")
                
                GroupBox {
                    VStack(alignment: .leading) {
                        Text("Phone: \(phone)")
                        Text("Address: \(address)")
                    }
                    .padding()
                } label: {
                    Label("Contact Into", systemImage: "phone.circle")
                }
                .padding(.vertical)
                
            }
        } label: {
            Label("User Info", systemImage: "person.crop.circle")
        }
        .padding()
    }
}

#Preview {
    User_Info_View(
        name: "John Doe",
        email: "johndoe@example.com",
        phone: "+1 234 567 890",
        address: "123 Main St, Anytown, USA"
    )
}
