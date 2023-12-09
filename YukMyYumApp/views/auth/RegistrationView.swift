//
//  RegistrationView.swift
//  YukMyYumApp
//
//  Created by Minh Pham on 2023-11-30.
//

import SwiftUI



struct RegistrationView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
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
                InputView(text: $fullname, title: "Full Name", placeHolder: "your name", isSecureField: false)
                InputView(text: $password, title: "Password", placeHolder: "P@ssw0rd", isSecureField: true)
                InputView(text: $confirmPassword, title: "Re-enter your password", placeHolder: "P@ss0rd", isSecureField: true)
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            //Sign-in button
            Button{
                print("Creating account")
                
                Task{
                    try await viewModel.createUser(withEmail: email, password: password, fullname: fullname)
                }
            }label:{
                HStack{
                    Text("CREATE ACCOUNT")
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
            Button{
                dismiss()
            }label:{
                HStack{
                    Text("Already have an acccount?")
                    Text("Sign in")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
            }
            
            //Spacer
            Spacer()
                .frame(minHeight: 5, idealHeight: 10, maxHeight: 20)
                .fixedSize()
            
        }//VStack
        
    }//body
    
}//struct




#Preview {
    RegistrationView()
}
