//
//  ContentView.swift
//  HBNU Task Scheduler
//
//  Created by 김종혁 on 2021/03/05.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

let storedUsername = "Myusername"
let storedPassword = "Mypassword"

struct ContentView: View {
    @State var username: String = ""
    @State var password: String = ""
    
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = false
    
    @ObservedObject var keyboardResponder = KeyboardResponder()
    var body: some View {
        ZStack {
            VStack {
                UserImage()
                
                TextField("Username", text: $username)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                SecureField("Password", text: $password)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
        
                if authenticationDidFail {
                    Text("아이디 또는 비밀번호가 올바르지 않습니다.")
                        .offset(y: -10)
                        .foregroundColor(.red)
                }
                
                Button(action: {
                    if self.username == storedUsername && self.password == storedPassword {
                        self.authenticationDidSucceed = true
                        self.authenticationDidFail = false
                    }else {
                        self.authenticationDidSucceed = false
                        self.authenticationDidFail = true
                    }
                }) {
                    LoginButtonContent()
                }
            }
            .padding()
            .offset(y: -keyboardResponder.currentHeight*0.9)
            
            if authenticationDidSucceed {
                Text("로그인 성공")
                    .font(.headline)
                    .frame(width: 250, height: 80)
                    .background(Color.green)
                    .cornerRadius(20.0)
                    .foregroundColor(.white)
                    .animation(Animation.default)
            }
        }
    }
}

struct UserImage : View {
    var body: some View {
        return Image("logo")
            .resizable()
            .aspectRatio(UIImage(named:
                                    "logo")!.size, contentMode: .fill)
            .frame(width: 200, height: 200)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
    }
}

struct LoginButtonContent : View {
    var body: some View {
        return Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.green)
            .cornerRadius(15.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
