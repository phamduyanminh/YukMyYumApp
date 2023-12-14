//
//  PlaceListView.swift
//  YukMyYumApp
//
//  Created by Minh Pham on 2023-12-13.
//

import SwiftUI
import MapKit


struct PlaceListView: View {
    
    let mapItems: [MKMapItem]
    
    var body: some View {
        
        List(mapItems, id: \.self){mapItem in
            PlaceView(mapItem: mapItem)
        }
        
    }//body
    
}//struct




//#Preview {
//    PlaceListView()
//}
