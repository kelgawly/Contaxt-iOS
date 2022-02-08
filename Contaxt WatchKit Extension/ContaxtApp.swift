//
//  ContaxtApp.swift
//  Contaxt WatchKit Extension
//
//  Created by Alex Waldron on 2/8/22.
//

import SwiftUI

@main
struct ContaxtApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
