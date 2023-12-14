//
//  MapUtilities.swift
//  YukMyYumApp
//
//  Created by Minh Pham on 2023-12-12.
//

import Foundation
import MapKit


func calculateDirection(from: MKMapItem, to: MKMapItem) async -> MKRoute?{
    let directionRequest = MKDirections.Request()
    directionRequest.transportType = [.automobile, .transit, .walking]
    directionRequest.source = from
    directionRequest.destination = to
    
    let directions = MKDirections(request: directionRequest)
    let response = try? await directions.calculate()
    return response?.routes.first
}


func calculateDistance(from: CLLocation, to: CLLocation) -> Measurement<UnitLength> {
    let distanceInMeters = from.distance(from: to)
    return Measurement(value: distanceInMeters, unit: .meters)
}


func performSearch(searchTerm: String, visibleRegion: MKCoordinateRegion?) async throws -> [MKMapItem] {
    
    let request = MKLocalSearch.Request()
    request.naturalLanguageQuery = searchTerm
    request.resultTypes = .pointOfInterest
    
    guard let region = visibleRegion else { return [] }
    request.region = region
    
    let search = MKLocalSearch(request: request)
    let response = try await search.start()
    
    return response.mapItems
    
}
