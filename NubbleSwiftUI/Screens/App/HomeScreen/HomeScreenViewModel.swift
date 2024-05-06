//
//  HomeScreenViewModel.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import Foundation

@Observable
class HomeScreenViewModel {
    private let postService: PostService
    var posts: [PostModel] = []
    
    init(postService: PostService = PostService()) {
        self.postService = postService
    }
    
    func loadPosts() async {
        do {
            let response = try await postService.getList(page: 0)
            print(response.data)
            posts = response.data
        } catch {
            print("Error while loading posts")
            print(error.localizedDescription)
        }
    }
}
