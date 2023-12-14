//
//  SearchOptionsView.swift
//  YukMyYumApp
//
//  Created by Minh Pham on 2023-12-13.
//

import SwiftUI

struct SearchOptionsView: View {
    let searchOptions = [
        "Restaurants" : "fork.knife",
        "Coffee" : "cup.and.saucer.fill",
        "Lounges" : "party.popper.fill",
        "Malls" : "bag.circle",
        "Hotels" : "bed.double.fill",
        "Gas" : "fuelpump.fill"
    ]
    
    let onSelected: (String) -> Void
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(searchOptions.sorted(by: >), id: \.0){key, value in
                    Button(action: {
                        onSelected(key)
                    }, label: {
                        HStack{
                            Image(systemName: value)
                            Text(key)
                        }
                    })
                    .buttonStyle(.borderedProminent)
                    .tint(Color(red: 236/255, green: 240/255, blue: 241/255, opacity: 1.0))
                    .foregroundStyle(.black)
                    .padding(4)
                }
            }
        }//ScrollView
        
    }//body
    
    
}//struct



//#Preview {
//    SearchOptionsView()
//}
