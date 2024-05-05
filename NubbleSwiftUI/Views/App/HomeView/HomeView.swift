//
//  HomeView.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel = HomeViewModel(postService: PostService())
    
    var body: some View {
        VStack {
            Text("Olá, bem vindo(a)!")
            
            ForEach(viewModel.posts) { post in
                Text(post.text)
            }
        }
        .onAppear {
            Task {
                await viewModel.loadPosts()
            }
        }
    }
}
