//
//  Learning_AppApp.swift
//  Learning App
//
//  Created by Liam Heskey on 19/08/2021.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
