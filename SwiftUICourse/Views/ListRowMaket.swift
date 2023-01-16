//
//  FriendListRow.swift
//  SwiftUICourse
//
//  Created by Илья Рехтин on 06.11.2022.
//

import SwiftUI

struct ListRowMaket: View {
    var mainImage = Image(systemName: "person")
    var mainTitle = ""
    var subTitle = ""
    
    var body: some View {
        HStack {
            Avatar(image: mainImage)
            VStack(alignment: .leading) {
                MainTitle(title: mainTitle)
                SubTitle(title: subTitle)
            }
            Spacer()
        }
        .padding([.leading, .top, .bottom, .trailing], 6)
    }
    
    init(image: Image, mainTitle: String, subTitle: String) {
        self.mainImage = image
        self.mainTitle = mainTitle
        self.subTitle = subTitle
    }
}




struct Avatar: View {
    var image: Image
    var body: some View {
        image
            .resizable()
            .frame(width: 50, height: 50)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay {
                Circle().stroke(.gray, lineWidth: 1)
            }
            .shadow(radius: 7)
            .aspectRatio(contentMode: .fill)
    }
}

struct MainTitle: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.title)
    }
}

struct SubTitle: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.title3)
            .foregroundColor(.gray)
    }
}


struct FriendListRow_preview: PreviewProvider {
    static var previews: some View {
        let friend = FriendViewModel(id: 0, avatar: Image("ava1"), name: "Иван Фролов", city: "Москва")
        ListRowMaket(image: friend.avatar, mainTitle: friend.name, subTitle: friend.city)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
