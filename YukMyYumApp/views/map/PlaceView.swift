//
//  PlaceView.swift
//  YukMyYumApp
//
//  Created by Minh Pham on 2023-12-13.
//

import SwiftUI
import MapKit

struct PlaceView: View {
    
    let mapItem: MKMapItem
    private var address: String{
        let placemark = mapItem.placemark
        let address = " \(placemark.thoroughfare ?? "") \(placemark.subThoroughfare ?? ""), \(placemark.locality ?? ""), \(placemark.administrativeArea ?? "") \(placemark.postalCode ?? ""), \(placemark.country ?? "") "
        return address
    }
    
    var body: some View {
        
        VStack(alignment: .leading){
            Text(mapItem.name ?? "N/A")
                .font(.title3)
            Text(address)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        
    }//body
    
}//struct



//#Preview {
//    PlaceView()
//}
