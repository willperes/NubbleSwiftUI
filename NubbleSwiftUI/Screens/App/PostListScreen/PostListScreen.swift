//
//  PostListScreen.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import SwiftUI

struct PostListScreen: View {
    @StateObject var viewModel = PostListScreenViewModel()
    
    var body: some View {
        List(viewModel.data.indices, id: \.self) { i in
            PostItemView(post: viewModel.data[i])
                .padding(.vertical, 14)
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
                .onAppear {
                    viewModel.shouldFetchMore(index: i)
                }
                .buttonStyle(PlainButtonStyle())
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
    }
}

#Preview {
    PostListScreen(viewModel: PostListScreenViewModel())
}
