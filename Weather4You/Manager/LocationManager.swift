import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    // This function requests the user's location.
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    
    // This function is called when the location is updated.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let newLocation = locations.last {
            location = newLocation.coordinate
            isLoading = false
        }
    }
    
    // This function handles location errors.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location Manager Error: \(error.localizedDescription)")
        isLoading = false
        // You can handle specific error cases here and provide feedback to the user if needed.
    }
}
