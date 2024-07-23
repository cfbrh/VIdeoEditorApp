//
//  RootViewModel.swift
//  VideoEditorApp
//
//  Created by 张 on 2024/7/23.
//

import Foundation
import CoreData
import PhotosUI
import SwiftUI

final class RootViewModel: ObservableObject{
    
    @Published var projects = [ProjectEntity]()
    private let dataManager: CoreDataManager
    
    
    init(mainContext: NSManagedObjectContext){
        self.dataManager = CoreDataManager(mainContext: mainContext)
    }
    
    func fetch(){
        projects = dataManager.fetchProjects()
    }
    
    func removeProject(_ project: ProjectEntity){
        ProjectEntity.remove(project)
        fetch()
    }
}
