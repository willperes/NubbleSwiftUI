//
//  HomeScreenViewModel.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import Foundation

class HomeScreenViewModel: ObservableObject {
    private let postService: PostService
    
    @Published var isLoading = true
    @Published var posts: [PostModel] = []
    
    init(postService: PostService = PostService()) {
        self.postService = postService
    }
    
    @MainActor
    func loadPosts() async {
        isLoading = true
        
        do {
            let response = try await postService.getList(page: 0)
            print(response.data)
            posts = response.data
        } catch {
            print("Error while loading posts")
            print(error.localizedDescription)
        }
        
        isLoading = false
    }
}
