//
//  Router.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 06/05/24.
//

import SwiftUI

class Router: ObservableObject {
    @Published var selectedTab: AppTab = .home
    
    @Published var routes = [Destination]()
    
    public enum Destination: Codable, Hashable {
        case postCommentScreen(postId: Int)
    }
    
    func navigate(to destination: Destination) -> Void {
        guard !routes.contains(destination) else {
            if let destinationIndex = routes.firstIndex(of: destination) {
                routes = Array(routes.prefix(through: destinationIndex))
            }
            
            return
        }
        
        routes.append(destination)
    }
    
    func goBack() {
        routes.removeLast()
    }
    
    func navigateToRoot() {
        routes = []
    }
}
