//
//  PostResponseDTO.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import Foundation

struct PostMetaResponseDTO: Decodable {
    let like_count: String
    let favorite_count: String
    let comments_count: String
}

struct PostResponseDTO: Decodable {
    let id: Int
    let text: String
    let user_id: Int
    let image_url: String
    let is_fixed: Bool
    let is_activated: Bool
    let created_at: String
    let updated_at: String
    let status: String
    let meta: PostMetaResponseDTO
    
    let user: UserApiModel
}
