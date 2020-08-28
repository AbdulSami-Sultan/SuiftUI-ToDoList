//
//  ToDoItems.swift
//  ToDoList_CoreData
//
//  Created by Abdul Sami Sultan on 08/04/2020.
//  Copyright © 2020 Sami. All rights reserved.
//

import Foundation
import CoreData

public class ToDoItems: NSManagedObject,Identifiable {
    @NSManaged public var createdAt: Date?
    @NSManaged public var title: String?
}
extension ToDoItems{
    static func getToDoList() -> NSFetchRequest<ToDoItems>{
        let requset: NSFetchRequest<ToDoItems> = ToDoItems.fetchRequest() as! NSFetchRequest<ToDoItems>
        let sorting = NSSortDescriptor.init(key: "createdAt", ascending: true)
        requset.sortDescriptors = [sorting]
        return requset
    }
    
}
