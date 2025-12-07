
import SwiftUI

struct ProductResponse: Codable {
    let products: [Product]
}

struct Product: Codable, Identifiable {
    let id: String
    let title: String
    let price: Int
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Text("Hello, World!")
        }
    }
}


#Preview {
    ContentView()
}
