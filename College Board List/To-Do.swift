import SwiftUI
import SwiftData

struct To_Do: View {
    @Environment(\.modelContext) var context
    @Query var people:[Person]
    @State var newName = ""
    var body: some View {
        VStack {
            VStack {
                Text("To Do List")
                    .font(.custom("AmericanTypewriter", size:35))
                    .padding()
            }
            HStack{
                TextField("Enter a name", text: $newName)
                    .textFieldStyle(.roundedBorder)
                    .font(.custom("AmericanTypewriter", size:20))
                    .padding()
                
                Button("+") {
                    if newName.replacingOccurrences(of: " ", with: "") != "" {
                        let person = Person(name: newName, college: "")
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
                    if currentPerson.name != "" {
                        Text(currentPerson.name)
                            .font(.custom("AmericanTypewriter", size:20))
                    }
                }
            }
        }
    }
}
