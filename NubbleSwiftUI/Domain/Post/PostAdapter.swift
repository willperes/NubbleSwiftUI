//
//  PostAdapter.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import Foundation

class PostAdapter {
    static func toPostModel(from postApiModel: PostApiModel) -> PostModel {
        let postModelAuthor = PostModel.Author(
            id: postApiModel.user.id,
            profileURL: postApiModel.user.profile_url,
            name: postApiModel.user.full_name,
            username: postApiModel.user.username
        )
        let postModel = PostModel(
            id: postApiModel.id,
            text: postApiModel.text,
            author: postModelAuthor,
            imageURL: postApiModel.image_url,
            reactionCount: Int(postApiModel.meta.like_count)!,
            commentCount: Int(postApiModel.meta.comments_count)!,
            favoriteCount: Int(postApiModel.meta.favorite_count)!
        )
        
        return postModel
    }
}
