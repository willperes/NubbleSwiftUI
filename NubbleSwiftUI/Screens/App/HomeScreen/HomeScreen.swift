//
//  HomeScreen.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import SwiftUI

struct HomeScreen: View {
    @State private var viewModel = HomeScreenViewModel()
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.posts) { post in
                PostItemView(post: post)
                    .padding(.vertical, 14)
            }
        }
        
        .navigationTitle("Posts")
        .navigationBarBackButtonHidden()
        .onAppear {
            Task {
                await viewModel.loadPosts()
            }
        }
        .onTapGesture {
            //
        }
    }
}
