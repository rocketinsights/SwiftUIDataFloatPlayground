//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct User: Identifiable, Equatable {
    var id: Int
    var name: String
    var birthday: Date
    var email: String
}

class UserService: ObservableObject {
    
    @Published var user: User?
    
    func login(username: String, password: String) {
        user = User(id: 12, name: "Irving Strunk", birthday: Date(), email: "irving.strunk@rocketinsights.com")
    }
}


struct LoginView: View {
        
    @EnvironmentObject var userService: UserService
    
    @State var username = ""
    @State var password = ""
    @State var isLoginSuccessful = false
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Username", text: $username)
                    .padding()
                
                SecureField("Password", text: $password)
                    .padding()
                
                Button("Login") {
                    userService.login(username: username, password: password)
                }
                
                NavigationLink("", destination: WelcomeView(), isActive: $isLoginSuccessful)
            }
        }
        .onChange(of: userService.user) { user in
            isLoginSuccessful = user != nil
        }
    }
}

struct WelcomeView: View {
    @EnvironmentObject var userService: UserService
    
    var body: some View {
        Text("Welcome \(userService.user?.name ?? "")")
    }
}

PlaygroundPage.current.setLiveView(
    LoginView()
        .frame(width: 375, height: 812)
        .environmentObject(UserService())
)

//: [Next](@next)
