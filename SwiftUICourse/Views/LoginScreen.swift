
//  SwiftUICourse
//
//  Created by Илья Рехтин on 05.11.2022.
//

import SwiftUI

struct LoginScreen: View {
    @State private var login = ""
    @State private var password = ""
    @Binding var logIn: Bool
    @State private var showAlertIncorrectValidate = false
    
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
                        verifyLogIn()
                    } label: {
                        Text("Log in")
                            .font(.title)
                        Image(systemName: "chevron.right")
                            .font(.title)
                    }.buttonStyle(.plain)
                        .textFieldStyle(.roundedBorder)
                        .foregroundColor(.white)
                }
            }
        .edgesIgnoringSafeArea(.all)
        .alert(isPresented: $showAlertIncorrectValidate) {
            Alert(title: Text("Ошибка!"), message: Text("Не правильный логин или пароль"))
        }
        
    }
    
    
    /// Авторизация
    private func verifyLogIn() {
        if self.login == "1" && self.password == "1" {
            //auth
            logIn = true
        } else {
            self.showAlertIncorrectValidate = true
        }
        self.password = ""
    }
}
