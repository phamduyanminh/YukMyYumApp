//
//  SettingRowView.swift
//  YukMyYumApp
//
//  Created by Minh Pham on 2023-11-30.
//

import SwiftUI



struct SettingRowView: View {
    
    let imageName: String
    let title: String
    let tintColor: Color
    
    var body: some View {
        
        HStack(spacing: 12){
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundColor(tintColor)
            
            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
            
        }//HStack
        
    }//body
    
}//struct




#Preview {
    SettingRowView(imageName: "circle.righthalf.filled", title: "title", tintColor: Color(.systemGray))
}
