//
//  PostItemView.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import SwiftUI

struct PostItemView: View {
    var post: PostModel
    
    private func getCommentText(postCommentCount: Int) -> String? {
        if postCommentCount == 0 { return nil }
        
        if postCommentCount == 1 {
            return "ver 1 comentário"
        }
        
        return "ver \(postCommentCount) comentários"
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                RemoteImage(url: post.author.profileURL)
                    .frame(width: 32, height: 32)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                
                Text(post.author.username)
                    .padding(.leading, 12)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 24)
            .padding(.bottom, 16)
            
            RemoteImage(url: post.imageURL)
                .aspectRatio(contentMode: .fill)
                .frame(height: 260)
                .clipped()
            
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                            .font(.system(size: 20))
                        Text(String(post.reactionCount))
                            .padding(.leading, 4)
                    }
                    .padding(.trailing, 24)
                    
                    HStack(spacing: 0) {
                        Image(systemName: "message")
                            .font(.system(size: 20))
                        Text(String(post.commentCount))
                            .padding(.leading, 4)
                    }
                    .padding(.trailing, 24)
                    
                    HStack(spacing: 0) {
                        Image(systemName: "bookmark")
                            .font(.system(size: 20))
                        Text(String(post.favoriteCount))
                            .padding(.leading, 4)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(post.author.username)
                    .font(.system(size: 16, weight: .bold))
                    .padding(.top, 16)
                
                Text(post.text)
                    .font(.system(size: 16))
                    .foregroundStyle(.secondary)
                
                if let commentText = getCommentText(postCommentCount: post.commentCount) {
                    Text(commentText)
                        .font(.system(size: 14, weight: .bold))
                        .padding(.top, 8)
                }
            }
            .padding(.top, 16)
            .padding(.horizontal, 24)
        }
    }
}

#Preview {
    PostItemView(
        post: PostModel(
            id: 1,
            text: "Bom dia!",
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
