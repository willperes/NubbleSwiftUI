//
//  PostModel.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import Foundation

struct PostModel: Identifiable {
    struct Author {
        let id: Int
        let profileURL: String
        let name: String
        let username: String
    }
    
    let id: Int
    let text: String
    let author: PostModel.Author
    let imageURL: String
    let reactionCount: Int
    let commentCount: Int
    let favoriteCount: Int
}
