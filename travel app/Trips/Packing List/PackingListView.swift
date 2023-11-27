//
//  PackingListView.swift
//  travel app
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI
import Forever

struct PackingListView: View {
    
    @Binding var packingList: [Todo]
    @State private var showAddSheet = false
    
    
    var body: some View {
        List($packingList, editActions: [.all]) { $todo in
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
        .toolbar {
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showAddSheet = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            ToolbarItem(){
                EditButton()
            }
        }
        
        
        .sheet(isPresented: $showAddSheet) {
            NewTodoView(sourceArray: $packingList)
        }
        
    }
}

struct PackingListView_Previews: PreviewProvider {
    static var previews: some View {
        PackingListView(packingList: .constant([]))
    }
}
