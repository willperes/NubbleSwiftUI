//
//  PostBottomView.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import SwiftUI

struct PostBottomView: View {
    let postAuthorUsername: String
    let postText: String
    let postCommentCount: Int
    
    private func getCommentText() -> String? {
        if postCommentCount == 0 { return nil }
        
        if postCommentCount == 1 {
            return "ver 1 comentário"
        }
        
        return "ver \(postCommentCount) comentários"
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(postAuthorUsername)
                .font(.system(size: 16, weight: .bold))
                .padding(.top, 16)
            
            Text(postText)
                .font(.system(size: 16))
                .foregroundStyle(.secondary)
            
            if let commentText = getCommentText() {
                Text(commentText)
                    .font(.system(size: 14, weight: .bold))
                    .padding(.top, 8)
            }
        }
    }
}

#Preview {
    PostBottomView(postAuthorUsername: "mariajulia", postText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut est.", postCommentCount: 22)
}
