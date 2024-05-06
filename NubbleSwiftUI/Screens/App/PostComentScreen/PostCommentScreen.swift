//
//  PostCommentScreen.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 06/05/24.
//

import SwiftUI

struct PostCommentScreen: View {
    let postId: Int
    
    var body: some View {
        VStack {
            Text("Post: \(postId)")
        }
        .navigationTitle("Comentários")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarRole(.editor)
    }
}
