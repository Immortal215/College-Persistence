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
            HStack {
                
                TextField("Enter a name", text: $newName)
                    .textFieldStyle(.roundedBorder)
                    .font(.custom("AmericanTypewriter", size:20))
                    .padding()
                
                Button("+") {
                    if newName.replacingOccurrences(of: " ", with: "") != "" {
                        let person = Person(name: newName, college: "", checked: false)
                        context.insert(person)
                        newName = ""
                    }
                }
                .font(.largeTitle)
                .padding()
            }
            .padding()
            
            List {
                ForEach(people) { item in
                    if item.name != "" {
                        HStack {
                            Button {
                                item.checked.toggle()
                               Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { timer in
                                   context.delete(item)
                                }
                            } label: {
                                Image(systemName: item.checked ? "checkmark.circle.fill" : "circle")
                                    .animation(.bouncy(duration: 1, extraBounce: 0.3))
                            }
                            Text(item.name)
                                .font(.custom("AmericanTypewriter", size:20))
                        }
                    }
                }
            }
        }
        .font(.custom("AmericanTypewriter", size:20))
        .animation(.smooth(duration: 1, extraBounce: 0.3))
    }
}
