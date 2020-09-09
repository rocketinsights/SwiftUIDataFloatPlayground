//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

class LoginViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    
    func login() {
        // Login logic
    }
}

struct LoginView: View {
    
    @ObservedObject var viewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            TextField("Username", text: $viewModel.username)
                .padding()
            
            SecureField("Password", text: $viewModel.password)
                .padding()
            
            Button("Login") {
                viewModel.login()
            }
        }
    }
}

PlaygroundPage.current.setLiveView(LoginView().frame(width: 375, height: 812))

//: [Next](@next)
