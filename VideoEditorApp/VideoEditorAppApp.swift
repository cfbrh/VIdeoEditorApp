//
//  VideoEditorAppApp.swift
//  VideoEditorApp
//
//  Created by 张 on 2024/7/22.
//

import SwiftUI

@main
struct VideoEditorSwiftUIApp: App {
    @StateObject var rootVM = RootViewModel(mainContext: PersistenceController.shared.viewContext)
    var body: some Scene {
        WindowGroup {
            RootView(rootVM: rootVM)
                .preferredColorScheme(.dark)
        }
    }
}
