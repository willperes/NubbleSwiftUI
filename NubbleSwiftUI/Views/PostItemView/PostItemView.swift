//
//  PostItemView.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import SwiftUI

struct PostItemView: View {
    var post: PostModel
    
    var body: some View {
        VStack(spacing: 0) {
            PostItemHeaderView(postAuthor: post.author)
            
            RemoteImageView(url: post.imageURL)
                .aspectRatio(contentMode: .fill)
                .frame(height: 260)
                .clipped()
            
            VStack(alignment: .leading, spacing: 0) {
                PostActionsView(
                    reactionCount: post.reactionCount,
                    commentCount: post.commentCount,
                    favoriteCount: post.favoriteCount)
                
                PostBottomView(
                    postAuthorUsername: post.author.username,
                    postText: post.text,
                    postCommentCount: post.commentCount,
                    postId: post.id)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 16)
            .padding(.horizontal, 24)
        }
    }
}

#Preview {
    PostItemView(
        post: PostModel(
            id: 1,
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut est.",
            author: PostModel.Author(
                id: 1,
                profileURL: "https://nubble-development.s3.sa-east-1.amazonaws.com/backend-integration/1-maria.png",
                name: "Maria Julia",
                username: "mariajulia"
            ),
            imageURL: "https://nubble-development.s3.sa-east-1.amazonaws.com/backend-integration/post1.jpg",
            reactionCount: 7,
            commentCount: 22,
            favoriteCount: 2
        )
    )
}
