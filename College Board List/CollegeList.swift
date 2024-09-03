import SwiftUI
import SwiftData

struct CollegeList: View {
    @Environment(\.modelContext) var context
    @Query var colleges:[Person]
    @State var newName = ""
    
    var body: some View {
        VStack {
            Text("Colleges!")
                .padding()
            
            HStack {
                TextField("Enter a name", text: $newName)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Button("+") {
                    if newName.replacingOccurrences(of: " ", with: "") != "" {
                        let college = Person(name: "", college: newName)
                        context.insert(college)
                        newName = ""
                    }
                }
                .font(.largeTitle)
                .padding()
            }
            .padding()
            
            List {
                ForEach(colleges) { college in
                    if college.college != "" {
                        Text(college.college)
                    }
                    
                }
            }
        }
        .font(.custom("AmericanTypewriter", size:35))

    }
}
