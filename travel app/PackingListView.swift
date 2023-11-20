//
//  PackingListView.swift
//  travel app
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI

struct PackingListView: View {
    
    @State private var todos = [
        Todo(title: "Passport", isCompleted: false),
        Todo(title: "Wallet", isCompleted: false),
    ]
    @State private var showAddSheet = false
    
    
    var body: some View {
        NavigationStack {
            List($todos) { $todo in
                HStack {
                    Image(systemName: todo.isCompleted ? "checkmark.circle.fill" :  "circle")
                        .onTapGesture {
                            todo.isCompleted.toggle()
                        }
                    VStack(alignment: .leading) {
                        Text(todo.title)
                            .strikethrough(todo.isCompleted)
                            .onTapGesture {
                                todo.isCompleted.toggle()
                            }
                        
                    }
                    
                }
                
            }
            .navigationTitle("Packing List")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        
            .sheet(isPresented: $showAddSheet) {
                NewTodoView(sourceArray: $todos)
            }
            
        }
    }


struct PackingListView_Previews: PreviewProvider {
    static var previews: some View {
        PackingListView()
    }
}
