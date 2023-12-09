//
//  LoginView.swift
//  YukMyYumApp
//
//  Created by Minh Pham on 2023-11-29.
//

import SwiftUI



struct LoginView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        
        NavigationStack{
            VStack{
                //Image
                Image("fast-food")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 120)
                    .padding(.vertical, 32)
                
                //Form field
                VStack(spacing: 24){
                    InputView(text: $email, title: "Email Address", placeHolder: "name@example.com")
                        .autocapitalization(.none)
                    InputView(text: $password, title: "Password", placeHolder: "P@ssw0rd", isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                //Sign-in button
                Button{
                    print("Signing user in")
                    
                    Task{
                        try await viewModel.signIn(withEmail: email, password: password)
                    }
                }label:{
                    HStack{
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 42)
                }
                .background(Color(.systemBlue))
                .cornerRadius(10)
                .padding(.top, 24)
                
                //Spacer
                Spacer()
                
                //Sing-up option
                NavigationLink{
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                }label:{
                    HStack{
                        Text("Don't have an acccount?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }
                
                //Spacer
                Spacer()
                    .frame(minHeight: 5, idealHeight: 10, maxHeight: 20)
                    .fixedSize()
                
            }//VStack
            .onAppear(){
                print("bhhhhhhh")
            }
        }//NavigationStack
        
    }//body
    
}//struct




#Preview {
    LoginView()
}
