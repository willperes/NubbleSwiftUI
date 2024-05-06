//
//  PostItemHeaderView.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import SwiftUI

struct PostItemHeaderView: View {
    let postAuthor: PostModel.Author
    
    var body: some View {
        HStack(spacing: 0) {
            RemoteImage(url: postAuthor.profileURL)
                .frame(width: 32, height: 32)
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 14))
            
            Text(postAuthor.username)
                .padding(.leading, 12)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 24)
        .padding(.bottom, 16)
    }
}

#Preview {
    PostItemHeaderView(postAuthor: PostModel.Author(
        id: 1,
        profileURL: "https://nubble-development.s3.sa-east-1.amazonaws.com/backend-integration/1-maria.png",
        name: "Maria Julia",
        username: "mariajulia"
    ))
}
