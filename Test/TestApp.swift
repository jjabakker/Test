//
//  TestApp.swift
//  Test
//
//  Created by Hans Bakker on 02/02/2026.
//

import SwiftUI

@main
struct TestApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ImageView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                TextView()
                    .tabItem {
                        Label("Settings", systemImage: "gearshape")
                    }
            }
        }
    }
}
