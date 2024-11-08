//
//  Overview.swift
//  ExpenseApp
//
//  Created by devxcode on 26/09/2024.
//

import SwiftUI

struct Overview: View {
    let data: [Expenses]
    let categories: [Category]

    var body: some View {
        TabView {
            NavigationView {
                VStack {
                    dateView(title: "Period start date", date: "22 Sept 2022")
                    dateView(title: "Period end date", date: "22 Sept 2022")

                    Divider().frame(maxWidth: 300).background(Color.gray)

                    List {
                        ForEach(categories, id: \.self) { category in
                            let totalAmount = data.filter { $0.category == category }.reduce(0) { $0 + $1.amount }
                            
                            HStack {
                                Text(category.rawValue)
                                    .font(.headline)
                                    .foregroundColor(colorForCategory(category))
                                    .padding(8)
                                    .overlay{Capsule().stroke(colorForCategory(category), lineWidth: 0.72)}
                                Spacer()
                                Text(String(format: "%.2f €", totalPerCategory[category] ?? 0.0))
                                    .font(.body)
                            }
                        }
                        Divider().frame(maxWidth: 300).background(Color.gray)
                        HStack{
                            Text("Total")
                                .font(.title2)
                                .bold()
                            Spacer()
                            Text(String(format:"%.2f €", totalExpenses))
                                .font(.title2)
                                .bold()
                        }
                        .padding(.top, 10)
                    }
                    .padding()
                    .listStyle(PlainListStyle())
                    .navigationTitle("Overview")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            EditButton()
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink("Add", destination: EmptyView())
                        }
                    }
                }
                .padding()
            }
        }
    }

    private func dateView(title: String, date: String) -> some View {
        HStack {
            Text(title)
            Text(date)
                .font(.footnote)
                .padding(3)
                .foregroundStyle(Color(.systemBlue))
                .frame(minWidth: 62)
                .overlay(Rectangle().stroke(Color(.systemGray5)))
            Spacer().frame(width: 10)
        }
    }
}

struct Overview_Previews: PreviewProvider {
    static var previews: some View {
        Overview(data: Expenses.testData, categories: Category.allCases)
    }
}

func colorForCategory(_ category: Category) -> Color {
    switch category {
    case .perso:
        return .red
    case .vacation:
        return .orange
    case .pro:
        return .green
    }
}

