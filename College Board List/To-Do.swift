import SwiftUI
import SwiftData

struct To_Do: View {
    @Environment(\.modelContext) var context
    @Query var people:[Person]
    @State var newName = ""
    var body: some View {
        VStack {
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
}
