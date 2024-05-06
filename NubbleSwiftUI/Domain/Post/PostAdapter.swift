//
//  PostAdapter.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import Foundation

class PostAdapter {
    static func toPostModel(from apiModel: PostApiModel) -> PostModel {
        let postModelAuthor = PostModel.Author(
            id: apiModel.user.id,
            profileURL: apiModel.user.profile_url,
            name: apiModel.user.full_name,
            username: apiModel.user.username
        )
        let postModel = PostModel(
            id: apiModel.id,
            text: apiModel.text,
            author: postModelAuthor,
            imageURL: apiModel.image_url,
            reactionCount: Int(apiModel.meta.like_count)!,
            commentCount: Int(apiModel.meta.comments_count)!,
            favoriteCount: Int(apiModel.meta.favorite_count)!
        )
        
        return postModel
    }
}
