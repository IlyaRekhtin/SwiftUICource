//
//  FriendPhotoView.swift
//  SwiftUICourse
//
//  Created by Илья Рехтин on 27.11.2022.
//

import SwiftUI

struct FriendPhotoView: View {
    var image: Image = Image("ava1")
    var body: some View {
        VStack {
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
                .offset(y: -130)
                .padding(.bottom)
                
        }
    }
}

