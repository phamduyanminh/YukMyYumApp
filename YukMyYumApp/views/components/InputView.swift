//
//  InputView.swift
//  YukMyYumApp
//
//  Created by Minh Pham on 2023-11-29.
//

import SwiftUI



struct InputView: View {
    
    @Binding var text: String
    let title: String
    let placeHolder: String
    var isSecureField = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 12){
            Text(title)
                .foregroundStyle(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)
            
            if(isSecureField){
                SecureField(placeHolder, text: $text)
                    .font(.system(size: 14))
            }else{
                TextField(placeHolder, text: $text)
                    .font(.system(size: 14))
            }
            
            Divider()
            
        }//VStack
        
    }//body
    
}//struct




#Preview {
    InputView(text: .constant(""), title: "Email Address", placeHolder: "name@example.com")
}
