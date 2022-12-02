//
//  LocationManager.swift
//  AppdevHackathonProject
//
//  Created by Youssef Ahmed on 11/30/22.
//

import CoreLocation
import Foundation

class LocationManager: NSObject, CLLocationManagerDelegate {
    static let shared = LocationManager()
    
    let manager  = CLLocationManager()
    
    var completion: ((CLLocation) -> Void)?
    
    public func getUserLocation(completion: @escaping ((CLLocation) -> Void)) {
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //let latLong: [CLLocationDegrees]

        let location = locations.last! as CLLocation
        
       let latitude = location.coordinate.latitude
       let longitude = location.coordinate.longitude
//        let latitude = location.coordinate.latitude
        
//        latLong = [longitude, latitude]
//        return latLong
        
        
    }
}
