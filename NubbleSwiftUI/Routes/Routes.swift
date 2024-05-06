//
//  Routes.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 06/05/24.
//

import SwiftUI

struct Routes: View {
    @ObservedObject var router = Router()
    
    var body: some View {
        NavigationStack(path: $router.navPath) {
            HomeScreen()
                .navigationDestination(for: Router.Destination.self) { destination in
                    switch destination {
                    case .postCommentScreen(let postId):
                        PostCommentScreen(postId: postId)
                    }
                }
                .environmentObject(router)
        }
    }
}
