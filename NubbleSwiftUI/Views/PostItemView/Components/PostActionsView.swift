//
//  PostActionsView.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import SwiftUI

struct PostActionsView: View {
    let reactionCount: Int
    let commentCount: Int
    let favoriteCount: Int
    
    var body: some View {
        HStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                    .font(.title3)
                Text(String(reactionCount))
                    .padding(.leading, 4)
            }
            .padding(.trailing, 24)
            
            HStack(spacing: 0) {
                Image(systemName: "message")
                    .font(.title3)
                Text(String(commentCount))
                    .padding(.leading, 4)
            }
            .padding(.trailing, 24)
            
            HStack(spacing: 0) {
                Image(systemName: "bookmark")
                    .font(.title3)
                Text(String(favoriteCount))
                    .padding(.leading, 4)
            }
        }
    }
}

#Preview {
    PostActionsView(reactionCount: 7, commentCount: 22, favoriteCount: 2)
}
