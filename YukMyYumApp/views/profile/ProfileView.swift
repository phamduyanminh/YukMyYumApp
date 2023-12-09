//
//  ProfileView.swift
//  YukMyYumApp
//
//  Created by Minh Pham on 2023-11-30.
//

import SwiftUI



struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        if let user = viewModel.currentUser{
            //List
            List{
                Section{
                    HStack{
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                        
                        VStack{
                            Text(user.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            Text(user.email)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }//HStack
                }
                
                Section("Theme"){
                    SettingRowView(imageName: "circle.righthalf.filled", title: "title", tintColor: Color(.systemGray))
                    Spacer()
                    Text("1.0.0")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Section("Account"){
                    Button{
                        print("Sign out")
                    }label:{
                        SettingRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: .red)
                    }
                    
                    Button{
                        print("Delete account")
                    }label:{
                        SettingRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: .red)
                    }
                }
            }//List
        }
        
    }//body
    
}//struct




#Preview {
    ProfileView()
}
