//
//  HomeNavigationStack.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 07/05/24.
//

import SwiftUI

struct HomeNavigationStack: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        NavigationStack(path: $router.routes) {
            PostListScreen()
                .navigationDestination(for: Router.Destination.self) { route in
                    switch route {
                    case .postCommentScreen(let postId):
                        PostCommentScreen(postId: postId)
                    }
                }
        }
    }
}
