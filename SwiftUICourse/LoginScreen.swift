
//  SwiftUICourse
//
//  Created by Илья Рехтин on 05.11.2022.
//

import SwiftUI

struct LoginScreen: View {
    @State private var login = ""
    @State private var password = ""
    
    var body: some View {
            ZStack {
                Image("startImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay {
                        Color.black
                            .opacity(0.4)
                    }
                    .blur(radius: 3.0)
                VStack{
                    TextField("Enter your login", text: $login)
                        .textFieldStyle(.roundedBorder)
                        .padding([.leading, .trailing])
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .padding([.leading, .trailing])
                        .padding(.bottom, 20)
                    Button {
                        print("login")
                    } label: {
                        Text("LogIn")
                            .font(.title)
                        Image(systemName: "chevron.right")
                            .font(.title)
                    }.buttonStyle(.plain)
                        .textFieldStyle(.roundedBorder)
                        .foregroundColor(.white)
                }
            }
        .edgesIgnoringSafeArea(.all)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
            .previewDevice("iPhone 12")
            .previewInterfaceOrientation(.portrait)
    }
}
