//
//  PostCommentScreen.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 06/05/24.
//

import SwiftUI

struct PostCommentScreen: View {
    let postId: Int
    @StateObject var viewModel: PostCommentScreenViewModel
    
    init(postId: Int) {
        self.postId = postId
        _viewModel = StateObject(wrappedValue: PostCommentScreenViewModel(postId: postId))
    }
    
    var body: some View {
        List(viewModel.data.indices, id: \.self) { i in
            PostCommentItemView(postComment: viewModel.data[i])
                .padding(.vertical, 8)
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
                .onAppear {
                    viewModel.shouldFetchMore(index: i)
                }
        }
        .overlay {
            if viewModel.isLoading {
                ProgressView()
                    .controlSize(.large)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Comentários")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarRole(.editor)
        
        VStack(spacing: 0) {
            TextMessageView {
                print("Message submited")
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 16)
    }
}

#Preview {
    PostCommentScreen(postId: 1)
}
