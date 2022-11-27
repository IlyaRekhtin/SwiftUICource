//
//  MainView.swift
//  SwiftUICourse
//
//  Created by Илья Рехтин on 08.11.2022.
//

import SwiftUI

struct MainView: View {
    @State private var shouldShowMainView = false
    
    var body: some View {
        NavigationView {
            HStack{
                LoginScreen(logIn: $shouldShowMainView)
                NavigationLink(destination: TabBarView(), isActive: $shouldShowMainView) {}
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewDevice("iPhone 12")
    }
}
