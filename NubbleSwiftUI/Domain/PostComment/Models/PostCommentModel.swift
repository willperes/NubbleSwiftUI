//
//  PostCommentModel.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 06/05/24.
//

import Foundation

struct PostCommentModel: Identifiable {
    struct Author {
        let id: Int
        let profileURL: String
        let name: String
        let username: String
    }
    
    let id: Int
    let message: String
    let createdAt: String
    let createdAtRelative: String
    let author: PostCommentModel.Author
}
