//
//  HomeScreen.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel = HomeScreenViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.posts.indices, id: \.self) { i in
                PostItemView(post: viewModel.posts[i])
                    .padding(.vertical, 14)
                    .listRowInsets(EdgeInsets())
                    .onAppear {
                        print(i)
                    }
            }
        }
        .overlay {
            if viewModel.isLoading {
                ProgressView()
                    .controlSize(.large)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Posts")
        .navigationBarBackButtonHidden()
        .onAppear {
            Task {
                await viewModel.loadPosts()
            }
        }
        .onTapGesture {
            //
        }
    }
}
