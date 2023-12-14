//
//  MapView.swift
//  YukMyYumApp
//
//  Created by Minh Pham on 2023-12-12.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var query: String = ""
    @State private var selectedDetent: PresentationDetent = .fraction(0.15)
    @State private var locationManager = LocationManager.shared
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)
    @State private var isSearching: Bool = false
    @State private var mapItems: [MKMapItem] = []
    @State private var visibleRegion: MKCoordinateRegion?
    
    var body: some View {
        ZStack {
            Map(position: $position) {
                UserAnnotation()
            }
            .onChange(of: locationManager.region, {
                withAnimation {
                    position = .region(locationManager.region)
                }
            })
            .sheet(isPresented: .constant(true), content: {
                VStack {
                    SearchBarView(search: $query, isSearching: $isSearching)
                    PlaceListView(mapItems: mapItems)
                    Spacer()
                }
                .presentationDetents([.fraction(0.15), .medium, .large])
                .presentationDragIndicator(.visible)
                .interactiveDismissDisabled()
                .presentationBackgroundInteraction(.enabled(upThrough: .medium))
            })//Map
        }//ZStack
        .onMapCameraChange {context in
            visibleRegion = context.region
        }
        .task(id: isSearching, {
            if isSearching {
                await search()
            }
        })
        
    }//body
    
    //Perfoms searching task
    private func search() async {
        do {
            mapItems = try await performSearch(searchTerm: query, visibleRegion: visibleRegion)
            print(mapItems)
            isSearching = false
        } catch {
            mapItems = []
            print(error.localizedDescription)
            isSearching = false
        }
    }//searching function
    
}//struct




#Preview {
    MapView()
}
