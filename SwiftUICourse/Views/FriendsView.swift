//
//  FriendsView.swift
//  SwiftUICourse
//
//  Created by Илья Рехтин on 27.11.2022.
//

import SwiftUI

struct FriendsView: View {
    @State private var friends: [FriendViewModel] = [
        FriendViewModel(id: 0, avatar: Image("ava1"), name: "Иван Фролов", city: "Москва"),
        FriendViewModel(id: 1, avatar: Image("VKLable"), name: "Иkzm TTTT", city: "Москва"),
        FriendViewModel(id: 2, avatar: Image("ava1"), name: "Иван Фролов", city: "Москва"),
        FriendViewModel(id: 3, avatar: Image("ava1"), name: "Иван Фролов", city: "Москва"),
        FriendViewModel(id: 4, avatar: Image("ava1"), name: "Иван Фролов", city: "Москва"),
        FriendViewModel(id: 5, avatar: Image("ava1"), name: "Иван Фролов", city: "Москва"),
        FriendViewModel(id: 6, avatar: Image("ava1"), name: "Иван Фролов", city: "Москва"),
        FriendViewModel(id: 7, avatar: Image("ava1"), name: "Иван Фролов", city: "Москва"),
        FriendViewModel(id: 8, avatar: Image("ava1"), name: "Иван Фролов", city: "Москва"),
        FriendViewModel(id: 9, avatar: Image("ava1"), name: "Иван Фролов", city: "Москва"),
        FriendViewModel(id: 10, avatar: Image("ava1"), name: "Иван Фролов", city: "Москва")
    ]
    
    var body: some View {
        List(friends){ friend in
            HStack{
                ListRowMaket(image: friend.avatar, mainTitle: friend.name, subTitle: friend.city)
                NavigationLink {
                    FriendPhotoView(image: friend.avatar)
                } label: {}
                    .fixedSize()
            }
            
        }
        .listStyle(.plain)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle("Мои друзья")
    }
}


struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
