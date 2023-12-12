//
//  LocationManager.swift
//  YukMyYumApp
//
//  Created by Minh Pham on 2023-12-12.
//

import Foundation
import MapKit
import Observation


enum LocationError: LocalizedError{
    case authorizationDenied
    case authorizationRestricted
    case unknownLocation
    case acccessDenied
    case network
    case operactionFailed
    
    var errorDescription: String?{
        switch self{
        case .authorizationDenied:
            return NSLocalizedString("Location access denied", comment: "")
        case .authorizationRestricted:
            return NSLocalizedString("Location access restricted", comment: "")
        case .unknownLocation:
            return NSLocalizedString("Location is unknown", comment: "")
        case .acccessDenied:
            return NSLocalizedString("Access denied", comment: "")
        case .network:
            return NSLocalizedString("Network failed", comment: "")
        case .operactionFailed:
            return NSLocalizedString("Operation failed", comment: "")
        }
    }
}


@Observable
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate{
    
    let manager = CLLocationManager()
    static let shared = LocationManager()
    var error: LocationError? = nil
    var region: MKCoordinateRegion = MKCoordinateRegion()
    
    override init(){
        super.init()
        self.manager.delegate = self
    }
    
}


extension LocationManager{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        locations.last.map{
            region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
        }
    }
    
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus{
        case .authorizedAlways:
            print(#function, "location access is granted always")
            manager.startUpdatingLocation()
        case .authorizedWhenInUse:
            print(#function, "location access is granted when in use")
            manager.startUpdatingLocation()
        case .notDetermined, .denied:
            error = .authorizationDenied
            print(#function, "user do not responded to location request")
            manager.requestWhenInUseAuthorization()
            print(#function, "location access is denied")
            manager.stopUpdatingLocation()
        case . restricted:
            error = .authorizationRestricted
            print(#function, "location access is restricted")
            manager.requestWhenInUseAuthorization()
            manager.requestAlwaysAuthorization()
        @unknown default:
            print(#function, "location access is not available")
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if let clError = error as? CLError{
            switch clError.code{
            case .locationUnknown:
                self.error = .unknownLocation
            case .denied:
                self.error = .acccessDenied
            case .network:
                self.error = .network
            default:
                self.error = .operactionFailed
            }
        }
    }
    
    
}
