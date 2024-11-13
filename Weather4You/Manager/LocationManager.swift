//
//  LocationManager.swift
//  Weather4You
//
//  Created by Widly D. on 2/26/24.
//
<<<<<<< HEAD
=======
// use this url link for the new updated JSON in the weatherData file
//  URL:https://api.openweathermap.org/data/3.0/onecall?lat=\(latitude)&lon=(longitude)&appid=3ff77e7b51c15385163313b00945aa63" \\
//
//
// url to copy and paste into Weathermanager file
//
// This API gives us an enhanced version of the Weather Information that we see
//
>>>>>>> ac333aa (Initial Commit)

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false;
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    //This request Location function is to request the users location\\
    func requestLocation () {
        isLoading = true
        manager.requestLocation()
    }
    
    // This location function is created to let the system know that since it is loading(is false), that means we're waiting on the location \\
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false   //false because we got the location
    }
    
    // This function is created to handle the errors that could be encountered \\
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("There was an error getting location", error)
        isLoading = false
    }
}
