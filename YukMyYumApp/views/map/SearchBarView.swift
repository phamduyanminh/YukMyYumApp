//
//  SearchBarView.swift
//  YukMyYumApp
//
//  Created by Minh Pham on 2023-12-13.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var search: String
    @Binding var isSearching: Bool
    
    var body: some View {
        
        VStack{
            TextField("Search", text: $search)
                .textFieldStyle(.roundedBorder)
                .padding()
                .onSubmit {
                    isSearching = true
                }//TextField
            SearchOptionsView{ searchOption in
                search = searchOption
                isSearching = true
            }//SearchOptionView
            .padding([.leading], 10)
            .padding([.bottom], 20)
        }//VStack
        
    }//body
    
}//struct




//#Preview {
//    SearchBarView()
//}
