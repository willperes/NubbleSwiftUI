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
        List {
            ForEach(viewModel.data) { data in
                Text(data.message)
                Text(data.createdAtRelative)
            }
        }
        .navigationTitle("Comentários")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarRole(.editor)
    }
}
