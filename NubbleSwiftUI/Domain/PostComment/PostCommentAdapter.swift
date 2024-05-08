//
//  PostCommentAdapter.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 06/05/24.
//

import Foundation

class PostCommentAdapter {
    static func toPostCommentModel(from dto: PostCommentResponseDTO) -> PostCommentModel {
        let author = PostCommentModel.Author(
            id: dto.user.id,
            profileURL: dto.user.profile_url,
            name: dto.user.full_name,
            username: dto.user.username)
        
        let postComment = PostCommentModel(
            id: dto.id,
            message: dto.message,
            createdAt: dto.created_at,
            createdAtRelative: DateUtils().formatRelative(from: dto.created_at) ?? "",
            author: author)
        
        return postComment
    }
}
