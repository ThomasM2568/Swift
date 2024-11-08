//
//  RowView.swift
//  todo
//
//  Created by devxcode on 26/09/2024.
//

import SwiftUI

struct RowView: View {
    let expense : Expenses
    var body: some View {
        HStack{
            
            //Image(systemName: todo.isCompleted ? "checkmark.cirle" : "circle")
            Spacer()
            Text(expense.title)
            
            Spacer()
            
            Text("\(expense.amount) €")
            Spacer()
            switch expense.category{
                case .pro:
                    Text(expense.category.rawValue)
                        .font(.footnote)
                        .padding(3)
                        .foregroundStyle(Color(.red))
                        .frame(minWidth: 62)
                        .overlay{
                            
                            Capsule().stroke(Color(.red),lineWidth: 0.72)
                            
                        }
                    Spacer()
                    .frame(width: 10)
                    
                    .font(.title2)
                    .padding()
                case .perso:
                    Text(expense.category.rawValue)
                        .font(.footnote)
                        .padding(3)
                        .foregroundStyle(Color(.green))

                        .frame(minWidth: 62)
                        .overlay{
                            Capsule().stroke(Color(.green),lineWidth: 0.72)
                            
                        }
                    Spacer()
                    .frame(width: 10)

                    
                    .font(.title2)
                    .padding()
                case .vacation:
                    Text(expense.category.rawValue)
                        .font(.footnote)
                        .padding(3)
                        .foregroundStyle(Color(.orange))

                        .frame(minWidth: 62)
                        .overlay{
                            Capsule().stroke(Color(.orange),lineWidth: 0.72)
                            
                        }
                    Spacer()
                    .frame(width: 10)
                    
                    .font(.title2)
                    .padding()
    
        }//switch ending
            
    }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(expense: Expenses.testData[0])
            .previewLayout(.sizeThatFits)
        
        RowView(expense: Expenses.testData[1])
            .previewLayout(.sizeThatFits)
        
    }
    
    
}

