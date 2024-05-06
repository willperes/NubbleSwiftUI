//
//  HomeScreenViewModel.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 05/05/24.
//

import SwiftUI

class HomeScreenViewModel: ObservableObject {
    private let postService = PostService()
    
    private var page = 1
    private var hasNextPage = true
    
    @Published var data: [PostModel] = []
    @Published var isLoading = true
    @Published var isFetchingMore = false
    @Published var isError = false
    
    init() {
        Task {
            await fetchInitialData()
        }
    }
    
    func shouldFetchMore(index: Int) {
        if index == data.count - 1 {
            Task {
                await fetchNextPage()
            }
        }
    }
    
    @MainActor
    func fetchInitialData() async {
        isLoading = true
        isError = false
        
        do {
            let response = try await postService.getList(page: page)
            data = response.data
            
            if response.meta.hasNextPage {
                page = 2
            } else {
                hasNextPage = false
            }
        } catch {
            isError = true
        }
        
        isLoading = false
    }
    
    @MainActor
    func fetchNextPage() async {
        if isFetchingMore || !hasNextPage {
            return
        }
        
        isFetchingMore = true
        isError = false
        
        do {
            let response = try await postService.getList(page: page)
            data.append(contentsOf: response.data)
            
            if response.meta.hasNextPage {
                page = page + 1
            } else {
                hasNextPage = false
            }
        } catch {
            isError = true
        }
        
        isFetchingMore = false
    }
}
