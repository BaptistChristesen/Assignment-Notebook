//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by caden christesen on 1/31/23.
//

import SwiftUI

struct ContentView: View {
    @State private var assignmentItems = [AssignmentItem(id: <#UUID#>, priority: "High", description: "", dueDate: Date()), AssignmentItem(id: <#UUID#>, priority: "Medium", description: "", dueDate: Date()), AssignmentItem(id: <#UUID#>, priority: "Low", description: "", dueDate: Date())]
    var body: some View {
        NavigationView{
            List{
                ForEach(assignmentItems) {item in
                    HStack{
                        VStack(alignment: .leading) {
                            Text(item.priority)
                                .font(.headline)
                            Text(item.description)
                        }
                        Spacer()
                        Text(item.dueDate, style: .date)
                    }
                }
                .onMove { indices, newOffset in
                    assignmentItems.move(fromOffsets: indices, toOffset: newOffset)
                }
                .onDelete { indexSet in
                    assignmentItems.remove(atOffsets: indexSet)
                }
                .navigationBarItems(leading: EditButton())
            }
        }
    }
}
struct AssignmentItem: Identifiable{
    var id: UUID
    var priority = String()
    var description = String()
    var dueDate = Date()
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
