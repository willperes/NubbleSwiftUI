//
//  PostAdapter.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import Foundation

class PostAdapter {
    static func toPostModel(from dto: PostResponseDTO) -> PostModel {
        let postModelAuthor = PostModel.Author(
            id: dto.user.id,
            profileURL: dto.user.profile_url,
            name: dto.user.full_name,
            username: dto.user.username
        )
        let postModel = PostModel(
            id: dto.id,
            text: dto.text,
            author: postModelAuthor,
            imageURL: dto.image_url,
            reactionCount: Int(dto.meta.like_count)!,
            commentCount: Int(dto.meta.comments_count)!,
            favoriteCount: Int(dto.meta.favorite_count)!
        )
        
        return postModel
    }
}
