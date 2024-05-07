//
//  PostCommentItemView.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 06/05/24.
//

import SwiftUI

struct PostCommentItemView: View {
    let postComment: PostCommentModel
    
    var body: some View {
        HStack(spacing: 0) {
            ProfileAvatarView(profileURL: postComment.author.profileURL)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(postComment.author.username)
                    .font(.system(size: 14, weight: .medium))
                
                Text("\(postComment.message) - \(postComment.createdAtRelative)")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(.secondary)
            }
            .padding(.leading, 12)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    PostCommentItemView(
        postComment: PostCommentModel(
            id: 95,
            message: "Perferendis corrupti desipio consectetur velit antea.",
            createdAt: "2024-04-30T20:00:39.000+00:00",
            createdAtRelative: "6 d",
            author: NubbleSwiftUI.PostCommentModel.Author(
                id: 2,
                profileURL: "https://nubble-development.s3.sa-east-1.amazonaws.com/backend-integration/4-tamires.png",
                name: "Tamires Silva", username: "tami_silva"
            )
        )
    )
}
