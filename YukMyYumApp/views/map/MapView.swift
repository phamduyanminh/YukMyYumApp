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
                    TextField("Search", text: $query)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .onSubmit {
                            isSearching = true
                        }
                    
                    Spacer()
                }
                .presentationDetents([.fraction(0.15), .medium, .large], selection: $selectedDetent)
                .presentationDragIndicator(.visible)
                .interactiveDismissDisabled()
                .presentationBackgroundInteraction(.enabled(upThrough: .medium))
            })//Map
        }//ZStack
        .task(id: isSearching, {
            if isSearching {
                await search()
            }
        })
        
    }//body
    
    //Perfoms searching task
    private func search() async {
        do {
            mapItems = try await performSearch(searchTerm: query, visibleRegion: locationManager.region)
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
