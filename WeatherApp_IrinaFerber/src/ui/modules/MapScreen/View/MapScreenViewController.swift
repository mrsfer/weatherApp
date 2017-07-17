//
//  MapScreenViewController.swift
//  WeatherApp_IrinaFerber
//
//  Created by Irina on 08.07.17.
//  Copyright © 2017 Irina. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import CoreData

class MapScreenViewController: BaseViewController, MapScreenViewInput, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager?
    var mapView: GMSMapView!
    var placesClient: GMSPlacesClient!
    var zoomLevel: Float = 15.0
    
    var isOpenMap = true
    
    var currentTemperature = String()
    
    // A default location to use when location permission is not granted.
    let defaultLocation = CLLocation(latitude: 56.5, longitude: 60.35)
    
    var viewOutput: MapScreenViewOutput!{
        get {
            return output as! MapScreenViewOutput
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.parent?.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(updateTemperature))
        
        isOpenMap = true
        if currentTemperature != "" {
            self.parent?.navigationItem.title = "Сейчас в вашем районе " + currentTemperature + "°"
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.parent?.navigationItem.rightBarButtonItem = nil
        isOpenMap = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateTemperature), name: .UIApplicationWillEnterForeground, object: nil)
        
        createMap()
        
    }
    
    func createMap() {
        
        // Initialize the location manager.
        locationManager = CLLocationManager()
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.distanceFilter = 50
        locationManager?.delegate = self
        locationManager?.startUpdatingLocation()
        
        placesClient = GMSPlacesClient.shared()
        
        // Create a map.
        let camera = GMSCameraPosition.camera(withLatitude: defaultLocation.coordinate.latitude,
                                              longitude: defaultLocation.coordinate.longitude,
                                              zoom: zoomLevel)
        mapView = GMSMapView.map(withFrame: view.bounds, camera: camera)
        mapView.settings.myLocationButton = true
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.isMyLocationEnabled = true
        
        // Add the map to the view, hide it until we've got a location update.
        view.addSubview(mapView)
        mapView.isHidden = true
    }
    
    func updateTemperature() {
        
        locationManager?.delegate = self
        locationManager?.startUpdatingLocation()
    }
    
// MARK: - CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.locationManager?.stopUpdatingLocation()
        self.locationManager?.delegate = nil

        startLoading()
        
        let location = locations.last
        
        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 17.0)
        
        if mapView.isHidden {
            mapView.isHidden = false
            mapView.camera = camera
        } else {
            mapView.animate(to: camera)
        }
        
        //Finally stop updating location otherwise it will come again and again in this delegate
        
        if let lat = location?.coordinate.latitude, let lon = location?.coordinate.longitude {
            
            viewOutput.onObtainWeather(latitude: String(lat), longitude: String(lon)){ [weak self] (temperature) in
                guard let strongSelf = self else { return }
                
                strongSelf.stopLoading()
                if let temperature = temperature {
                    
                    if strongSelf.isOpenMap == true {
                        strongSelf.parent?.navigationItem.title = "Сейчас в вашем районе " + temperature + "°"
                        strongSelf.parent?.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(strongSelf.updateTemperature))
                    }
                    strongSelf.currentTemperature = temperature
                } else {
                    strongSelf.parent?.navigationItem.title = ""
                    strongSelf.currentTemperature = ""
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted:
            print("Location access was restricted.")
        case .denied:
            print("User denied access to location.")
            // Display the map using the default location.
            mapView.isHidden = false
        case .notDetermined:
            print("Location status not determined.")
        case .authorizedAlways: fallthrough
        case .authorizedWhenInUse:
            print("Location status is OK.")
        }
    }

}

