import SwiftUI
import SwiftData

struct To_Do: View {
    @Environment(\.modelContext) var context
    @Query var people:[Person]
    @State var newName = ""
    @State var clicked = false
    @State var texter = ""
    @State var screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            VStack {
                Text("To Do List")
                    .font(.custom("AmericanTypewriter", size:35))
                    .padding()
            }
            HStack {
                
                TextField("Enter an objective", text: $newName)
                    .onSubmit {
                        if newName.replacingOccurrences(of: " ", with: "") != "" {
                            let person = Person(name: newName, college: "", checked: false, workText: "Description")
                            context.insert(person)
                            newName = ""
                        }
                    }
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                
                
                Button("+") {
                    if newName.replacingOccurrences(of: " ", with: "") != "" {
                        let person = Person(name: newName, college: "", checked: false, workText: "Description")
                        context.insert(person)
                        newName = ""
                    }
                }
                .font(.largeTitle)
                .padding()
            }
            .padding()
            
            ScrollView {
                ForEach(people) { item in
                    var index = people.index(of: item)!
                    
                    if item.name != "" {
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(lineWidth: 3)
                                .frame(width: item.checked ? 0 : screenWidth/1.2, height: 50, alignment: .center)
                                .animation(.linear(duration: 1))
                            
                            HStack {
                                Button {
                                    item.checked.toggle()
                                    context.delete(item)
                                    
                                } label: {
                                    Image(systemName: item.checked ? "checkmark.circle.fill" : "circle.dashed")
                                    
                                }
                                .padding()
                                
                                if item.checked != true {
                                    HStack {
                                        Text("\(item.name) ")
                                        Spacer()
                                        Button {
                                            clicked.toggle()
                                            
                                        } label : {
                                            Text(item.workText)
                                                .foregroundStyle(.gray)
                                        }
                                        .sheet(isPresented: $clicked, content: {
                                            TextField(item.workText == "Description" ? "Enter Description" : "\(item.workText)", text: $texter )
                                                .onSubmit {
                                                    item.workText = texter
                                                    texter = ""
                                                    clicked.toggle()
                                                }
                                                .textFieldStyle(.roundedBorder)
                                                .padding()
                                            Spacer()
                                        })
                                        .padding()
                                    }
                                    .animation(.easeInOut(duration: 1))
                                    
                                }
                                
                            }
                            .frame(width: item.checked ? 0 : screenWidth/1.2, height: 50)
                            .animation(.linear(duration: 1))
                            .padding()
                            
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                    }
                }
            }
        }
        .font(.custom("AmericanTypewriter", size:20))
        .animation(.bouncy(duration: 1))
    }
}
