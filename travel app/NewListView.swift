//
//  NewListView.swift
//  travel app
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI

struct NewListView: View {
    
    @Binding var lists: [List]
    @State private var title = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section {
                TextField("Enter a title", text: $title)
            }
            
            Section {
                Button("Save", role: .none) {
                    // code to save the todo
                    let newList = List(title: title)
                    lists.append(newList)
                    dismiss()
                }
                Button("Cancel", role: .destructive) {
                    // code to cancel
                    dismiss()
                }
            }
        }
    }
}

struct NewListView_Previews: PreviewProvider {
    static var previews: some View {
        NewListView(lists: .constant([]))
    }
}
