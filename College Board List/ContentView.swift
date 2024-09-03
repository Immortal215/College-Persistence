import SwiftUI
import SwiftData

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            To_Do()
                .tabItem {
                    Label("To Do", systemImage: "pencil")
                }
                .tag(0)
            
            CollegeList()
                .tabItem {
                    Label("College", systemImage: "text.book.closed.fill")
                }
                .tag(1)
        }
        .tabViewStyle(.automatic)
    }
}

@Model
class Person {
    var name: String
    var college: String
    var checked: Bool
    
    init(name: String, college: String, checked: Bool) {
        self.name = name
        self.college = college
        self.checked = checked
    }
}

#Preview {
    ContentView()
}
