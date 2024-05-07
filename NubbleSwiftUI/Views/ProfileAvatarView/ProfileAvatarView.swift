//
//  ProfileAvatarView.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 06/05/24.
//

import SwiftUI

struct ProfileAvatarView: View {
    let profileURL: String
    let size: CGFloat
    let cornerRadius: CGFloat
    
    init(profileURL: String, size: CGFloat = 32, cornerRadius: CGFloat = 14) {
        self.profileURL = profileURL
        self.size = size
        self.cornerRadius = cornerRadius
    }
    
    var body: some View {
        RemoteImageView(url: profileURL)
            .frame(width: size, height: size)
            .aspectRatio(contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}
