import SwiftUI

struct ContentView: View {
    let data: [Expenses]
    @State var MyCategory: Category = .pro
    @State private var selectedCategory: String = "All"
    
    var filteredData: [Expenses] {
        if selectedCategory == "All" {
            return data
        }
        else{
            return data.filter{ $0.category.rawValue == selectedCategory}
        }
    }
    var body: some View {
        
        TabView {
            
            NavigationView {
                VStack{
                    HStack{
                        Picker("Category",selection: $selectedCategory){
                            Text("All").tag("All")
                            ForEach(Category.allCases, id: \.self) {
                                category in Text(category.rawValue).tag(category.rawValue)
                            }
                            
                        }.pickerStyle(SegmentedPickerStyle())
                            .padding()
                    }
                    
                    List {
                        ForEach(filteredData, id:\.id) { expense in
                            RowView(expense: expense)
                        }
                    }
                    .listStyle(PlainListStyle())
                    .navigationTitle("Expenses")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            EditButton()
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink("Add", destination: EmptyView())
                        }
                    }
                }
                    
                    
                }
            .tabItem {
                Label("Expenses", systemImage: "list.bullet")
            }
            
            NavigationView {
                Overview(data: Expenses.testData, categories: Category.allCases)
            }
            .tabItem {
                Label("Overview", systemImage: "chart.bar")
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(data: Expenses.testData)
    }
}
