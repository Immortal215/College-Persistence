import SwiftUI
import SwiftData

struct ContentView: View {
    
    // way to get swiftdata
    @Environment(\.modelContext) var context
    @Query var people:[Person]
    
//    @State var count = UserDefaults.standard.integer(forKey: "count")
//    @AppStorage("shower") var shower = false
    
//    @State var friends: [String] = []
    @State var newName = ""
    
    var body: some View {
//        VStack {
//            Button("\(count)") {
//                count += 1
//                UserDefaults.standard.set(count, forKey: "count")
//            }
//            .font(.largeTitle)
//            Text(shower ? "hello" : "")
//            Button ("Show Hello World"){
//                shower.toggle()
//            }
//            Toggle("Show Hello World", isOn: $shower)
//        }
//        .padding()
        HStack {
            TextField("Enter a name", text: $newName)
//                friends.append(newName)
//                newName = ""
//                UserDefaults.standard.set(friends, forKey: "friends")
//            }
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
//        List(friends, id:\.self) { name in
//           Text(name)
//        }
//        .onAppear {
//            if let retrieved = UserDefaults.standard.stringArray(forKey: "friends") {
//             friends = retrieved
//            }
//        }
    }
}

@Model
class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}


