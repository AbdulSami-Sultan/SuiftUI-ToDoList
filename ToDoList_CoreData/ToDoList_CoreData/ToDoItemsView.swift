//
//  ToDoItemsView.swift
//  ToDoList_CoreData
//
//  Created by Abdul Sami Sultan on 08/04/2020.
//  Copyright © 2020 Sami. All rights reserved.
//

import SwiftUI

struct ToDoItemsView: View {
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    var title: String = ""
    var createdAt: String = ""
    var body: some View {
     HStack{
        VStack(alignment: .leading) {
            Text(title)
            .font(.headline)
            Text(createdAt)
            .font(.caption)
        }
        }
        
        
    }
}

struct ToDoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemsView(title: "my jobs", createdAt: "today")
    }
}
