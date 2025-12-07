
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
    @State var products: [Product] = []
    var body: some View {
        NavigationStack {
            List(products) { product in
                HStack {
                    Text(product.title)
                        .font(.headline)
                    Text("$\(product.price)")
                }
            }
        }
        .navigationTitle(Text("중고마켓"))
        .task {
            await loadData()
        }
    }
    // 데이터 가져오는 함수
        func loadData() async {
            guard let url = URL(string: "https://dummyjson.com/products") else { return }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decodedResponse = try JSONDecoder().decode(ProductResponse.self, from: data)
                self.products = decodedResponse.products
            } catch {
                print("에러 발생: \(error)")
            }
        }
    }




#Preview {
    ContentView()
}
