//
//  NewTodoView.swift
//  travel app
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI

struct NewTodoView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var sourceArray: [Todo]
    @State private var todoTitle = ""
    @State private var todoSubtitle = ""
    var body: some View {
        Form {
            Section("Info") {
                TextField("Title", text: $todoTitle)
            }
            
            Section("Actions") {
                Button("Save") {
                    let todo = Todo(title: todoTitle)
                    sourceArray.append(todo)
                    dismiss()
                    // TODO: (ha ha, TODO, get it) Save and dismiss
                }
                Button("Cancel", role: .destructive) {
                    // TODO: just dismiss
                    dismiss()
                }
            }
        }
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView(sourceArray: .constant([]))
    }
}
