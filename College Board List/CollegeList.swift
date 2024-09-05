import SwiftUI
import SwiftData

struct CollegeList: View {
    @Environment(\.modelContext) var context
    @Query var colleges:[Person]
    @State var newName = ""
    @State var screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            Text("Colleges")
                .padding()
                .font(.custom("AmericanTypewriter", size:35))
            
            HStack {

                TextField("Enter a College", text: $newName)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .frame(maxWidth: screenWidth/1.2)
                
                Button("+") {
                    if newName.replacingOccurrences(of: " ", with: "") != "" {
                        let college = Person(name: "", college: newName, checked: false)
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
                        HStack {
                            Button {
                                college.checked.toggle()
                               
                                   context.delete(college)
                                
                            } label: {
                                Image(systemName: "trash.fill")
                                    .animation(.bouncy(duration: 1, extraBounce: 0.3))
                                    .foregroundStyle(.red)
                            }
                            Text(college.college)
                        }
                    }
                    
                }
            }
        }
        .font(.custom("AmericanTypewriter", size:20))
        .animation(.smooth(duration: 1, extraBounce: 0.3))
    }
}
