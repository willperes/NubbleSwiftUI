//
//  PostCommentResponseDTO.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 06/05/24.
//

import Foundation

struct PostCommentResponseDTO: Decodable {
    let id: Int
    let message: String
    let user_id: Int
    let post_id: Int
    let created_at: String
    let updated_at: String
    let user: UserApiModel
    // let meta: Any // TODO: Fix this
}
