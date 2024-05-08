//
//  AppTab.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 07/05/24.
//

import SwiftUI

enum AppTab: Hashable, Identifiable, CaseIterable {
    case home
    case newPost
    case bookmarks
    case myProfile
    
    var id: AppTab { self }
    
    @ViewBuilder
    var label: some View {
        switch self {
        case .home:
            Label("Início", systemImage: "house")
        case .newPost:
            Label("Novo post", systemImage: "plus.circle")
        case .bookmarks:
            Label("Favoritos", systemImage: "bookmark")
        case .myProfile:
            Label("Meu perfil", systemImage: "person.circle")
        }
    }
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .home:
            HomeNavigationStack()
        case .newPost:
            VStack {
                Text("Novo post")
            }
        case .bookmarks:
            VStack {
                Text("Favoritos")
            }
        case .myProfile:
            VStack {
                Text("Meu perfil")
            }
        }
    }
    
    var navigationTitle: String {
        switch self {
        case .home: "Início"
        case .newPost: "Novo post"
        case .bookmarks: "Favoritos"
        case .myProfile: "Meu perfil"
        }
    }
}

struct AppTabScreen: View {
    @StateObject var router = Router()
    
    var body: some View {
        TabView(selection: $router.selectedTab) {
            ForEach(AppTab.allCases) { screen in
                screen.destination
                    .tag(screen as AppTab)
                    .tabItem { screen.label }
            }
        }
        .environmentObject(router)
        .navigationTitle(router.selectedTab.navigationTitle)
    }
}
