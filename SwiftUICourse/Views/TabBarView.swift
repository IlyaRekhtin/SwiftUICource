//
//  TabBarView.swift
//  SwiftUICourse
//
//  Created by Илья Рехтин on 27.11.2022.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            NewsfeedView()
                .tabItem {
                    Label("Новости", systemImage: "house.fill")
                }
            FriendsView()
                .tabItem {
                    Label("Друзья", systemImage: "person.circle.fill")
                }
            GroupsView()
                .tabItem {
                    Label("Группы", systemImage: "rectangle.grid.2x2.fill")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}
