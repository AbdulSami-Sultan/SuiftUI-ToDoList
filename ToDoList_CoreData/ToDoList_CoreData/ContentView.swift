//
//  ContentView.swift
//  ToDoList_CoreData
//
//  Created by Abdul Sami Sultan on 08/04/2020.
//  Copyright © 2020 Sami. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: ToDoItems.getToDoList()) var toDoItems: FetchedResults<ToDoItems>
    @State private var newToDo = ""
    @State private var secondScreen = false
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Add New")){
                    HStack{
                        
                       TextField("New Item", text: self.$newToDo)
                        Button(action: {
                            let todoItem = ToDoItems(context: self.managedObjectContext)
                            todoItem.title = self.newToDo
                            todoItem.createdAt = Date()
                            
                            do{
                                try self.managedObjectContext.save()
                            }catch{
                                print(error)
                            }
                            self.newToDo = ""
                            
                        }){
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }
                }.font(.headline)

                Section(header: Text("To Do's")){
                    ForEach(self.toDoItems){toDoItem in
                       ToDoItemsView(title: toDoItem.title!, createdAt: "\(toDoItem.createdAt!)")
                        
                    }.onDelete{ indexSet in
                let deleteItem = self.toDoItems[indexSet.first!]
                self.managedObjectContext.delete(deleteItem)
                do{
                    try self.managedObjectContext.save()
                }catch{
                    print(error)
                }

            }
                }
            }
                    
            .navigationBarTitle(Text("My List"))
        .navigationBarItems(trailing: EditButton())
        
        }
  

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
