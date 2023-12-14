//
//  SelectedPlaceDetailView.swift
//  YukMyYumApp
//
//  Created by Minh Pham on 2023-12-14.
//

import SwiftUI
import MapKit


struct SelectedPlaceDetailView: View {
    
    @Binding var mapItem: MKMapItem?
    
    var body: some View {
        
        HStack(alignment: .top){
            VStack(alignment: .leading){
                if let mapItem{
                    PlaceView(mapItem: mapItem)
                }
            }//VStack
            
            Image(systemName: "xmark.circle.fill")
                .padding([.trailing], 10)
                .onTapGesture {
                    mapItem = nil
                }
        }//HStack
        
    }//body
    
}//struct



//#Preview {
//    SelectedPlaceDetailView()
//}
