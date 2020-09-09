//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

class LoginRegistrationViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    
    func login() {
        // Login logic
    }
    
    func register() {
        // Register logic
    }
}

struct LoginRegistrationView: View {
    
    enum Mode {
        case login
        case register
        
        mutating func toggle() {
            switch self {
            case .login:
                self = .register
            case .register:
                self = .login
            }
        }
    }
    
    @StateObject var viewModel = LoginRegistrationViewModel()
    
    let mode: Mode
    
    var body: some View {
        VStack {
            TextField("Username", text: $viewModel.username)
                .padding()
            
            SecureField("Password", text: $viewModel.password)
                .padding()
            
            Button(mode == .register ? "Register" : "Login") {
                switch mode {
                case .login:
                    viewModel.login()
                case .register:
                    viewModel.register()
                }
            }
        }
    }
}

struct LandingScreen: View {
    @State var loginMode: LoginRegistrationView.Mode = .login
    
    var body: some View {
        VStack {
            // Other views
            
            LoginRegistrationView(mode: loginMode)
            
            Button(loginMode == .register ? "Already have an account?" : "Create a new account?") {
                loginMode.toggle()
            }
        }
    }
}

PlaygroundPage.current.setLiveView(LandingScreen().frame(width: 375, height: 812))

//: [Next](@next)
