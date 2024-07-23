//
//  CoreDataManager.swift
//  VideoEditorApp
//
//  Created by 张 on 2024/7/23.
//

import Foundation
import CoreData

struct CoreDataManager {
    
    let mainContext: NSManagedObjectContext
    
    init(mainContext: NSManagedObjectContext) {
        self.mainContext = mainContext
    }
    
    
    func fetchProjects() -> [ProjectEntity] {
        let fetchRequest = ProjectEntity.request()
    
        do {
            let projects = try mainContext.fetch(fetchRequest)
            return projects
        } catch let error {
            print("Failed to fetch FoodEntity: \(error)")
        }
        return []
    }
    
}
