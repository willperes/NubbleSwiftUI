//
//  HomeScreen.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import SwiftUI

struct HomeScreen: View {
    @State private var viewModel = HomeScreenViewModel(postService: PostService())
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(viewModel.posts) { post in
                    PostItemView(post: post)
                        .padding(.vertical, 14)
                }
            }
            
            .navigationTitle("Posts")
            .onAppear {
                Task {
                    await viewModel.loadPosts()
                }
            }
        }
    }
}
