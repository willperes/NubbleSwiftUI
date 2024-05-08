//
//  NubbleSwiftUIApp.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import SwiftUI

@main
struct NubbleSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            AppTabScreen()
                .ignoresSafeArea()
        }
    }
}
