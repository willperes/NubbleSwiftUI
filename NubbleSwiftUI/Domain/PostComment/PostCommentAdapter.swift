//
//  PostCommentAdapter.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 06/05/24.
//

import Foundation

class PostCommentAdapter {
    static func toPosCommenttModel(from apiModel: PostCommentApiModel) -> PostCommentModel {
        let author = PostCommentModel.Author(
            id: apiModel.user.id,
            profileURL: apiModel.user.profile_url,
            name: apiModel.user.full_name,
            username: apiModel.user.username)
        
        let postComment = PostCommentModel(
            id: apiModel.id,
            message: apiModel.message,
            createdAt: apiModel.created_at,
            createdAtRelative: DateUtils().formatRelative(from: apiModel.created_at) ?? "",
            author: author)
        
        return postComment
    }
}
