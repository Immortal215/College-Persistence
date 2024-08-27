import SwiftUI
import SwiftData

struct ContentView: View {
    
    // way to get swiftdata
    @Environment(\.modelContext) var context
    @Query var people:[Person]
    @State var newName = ""
    
    var body: some View {
        HStack {
            TextField("Enter a name", text: $newName)
            .textFieldStyle(.roundedBorder)
            .padding()
            Button("+") {
                if newName.replacingOccurrences(of: " ", with: "") != "" {
                    let person = Person(name: newName)
                    context.insert(person)
                    newName = ""
                }
            }
            .font(.largeTitle)
            .padding()
        }
        .padding()

        List {
            ForEach(people) { currentPerson in
                Text(currentPerson.name)
            }
        }
    }
}

@Model
class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

#Preview {
    ContentView()
}
