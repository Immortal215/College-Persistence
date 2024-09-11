import SwiftUI
import SwiftData

struct CollegeList: View {
    @Environment(\.modelContext) var context
    @Query var colleges: [Person]
    @State var newName = ""

    var body: some View {
        VStack {
            Text("College List")
                .padding()
                .font(.custom("AmericanTypewriter", size: 35))

            HStack {
                TextField("Enter a College", text: $newName)
                    .textFieldStyle(.roundedBorder)
                    .padding()

                
                Button(action: addCollege) {
                    Image(systemName: "plus.viewfinder")
                        .padding()
                }
            }
            .padding()

            List {
                ForEach(colleges) { college in
                    if !college.college.isEmpty {
                        HStack {
                            Button {
                                college.checked.toggle()
                                context.delete(college)
                            } label: {
                                Image(systemName: "trash.fill")
                                    .foregroundColor(.red)
                            }
                            Text(college.college)
                        }
                    }
                }
            }
        }
        .font(.custom("AmericanTypewriter", size: 20))
    }

    func addCollege() {
        if !newName.trimmingCharacters(in: .whitespaces).isEmpty {
            let college = Person(name: "", college: newName, checked: false, workText: "")
            context.insert(college)
            newName = ""
        }
    }
    
}

