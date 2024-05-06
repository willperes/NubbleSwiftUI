//
//  Router.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 06/05/24.
//

import SwiftUI

final class Router: ObservableObject {
    public enum Destination: Codable, Hashable {
        case postCommentScreen(postId: Int)
    }
    
    @Published var navPath = NavigationPath()
    
    func navigate(to destination: Destination) -> Void {
        navPath.append(destination)
    }
    
    func goBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
