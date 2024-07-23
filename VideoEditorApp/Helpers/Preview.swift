//
//  Preview.swift
//  VideoEditorApp
//
//  Created by 张 on 2024/7/23.
//

import CoreData
import SwiftUI

extension PreviewProvider {
    
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
    


    
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }
    
    
    let contreller = PersistenceController(inMemory: true)
    
    var viewContext: NSManagedObjectContext {
        
         
        _ = projects
//
//        _ = accounts
//
        return contreller.viewContext
     }
    
//    var transactions: [TransactionEntity]{
//        let context = contreller.viewContext
//        let trans1 = TransactionEntity(context: context)
//        trans1.id = UUID().uuidString
//        trans1.createAt = Date.now
//        trans1.amount = 1300
//        trans1.currencyCode = "RUB"
//        trans1.type = TransactionType.income.rawValue
//        trans1.category = category[1]
        
    
    var projects: [ProjectEntity]{
        let context = contreller.viewContext
        let project1 = ProjectEntity(context: context)
        project1.id = UUID().uuidString
        project1.createAt = Date.now
        project1.url = "file:///Users/zhang/Library/Developer/CoreSimulator/Devices/1C5B7EFB-4D8F-4EDA-9F9D-1F19ED749EEF/data/Containers/Data/Application/26486DAF-2DCD-469A-9539-BDF599A6C50B/Documents/548E915D-3628-4B81-B3C7-B81EBFA36D0A.mp4"
        
        return [project1]
    }

}

