//
//  SecondViewController.swift
//  D05
//
//  Created by Erwan SEVENO on 10/10/16.
//  Copyright © 2016 Erwan SEVENO. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class SecondViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    var index : Int = 1000

    @IBOutlet weak var Map: MKMapView!
    @IBOutlet weak var segcont: UISegmentedControl!
    @IBAction func MOI(sender: UIButton) {
        centerMapOnLocation(mylocation)
    }
    
    
    @IBAction func segaction(sender: UISegmentedControl) {
        if(segcont.selectedSegmentIndex == 0)
        {
             Map.mapType = .Standard
        }
        else if(segcont.selectedSegmentIndex == 1)
        {
           Map.mapType = .Satellite
        }
        else if(segcont.selectedSegmentIndex == 2)
        {
           Map.mapType = .Hybrid
        }
    }
    
    override func viewDidAppear(animated: Bool){
        var chooseloc : CLLocation
        
        if index == 0{
             chooseloc = CLLocation(latitude: 48.896592, longitude: 2.318373)
            }
        else if index == 1{
            chooseloc = CLLocation(latitude: 45.85, longitude: 1.25)}
        else if index == 2{
            chooseloc =  CLLocation(latitude: 43.4333, longitude: 6.6333)}
        else{
            chooseloc = CLLocation(latitude: 48.896592, longitude: 2.318373)
        }
        centerMapOnLocation(chooseloc)
    }
    
    var mylocation : CLLocation!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = 1
        locationManager.startUpdatingLocation()
        centerMapOnLocation(initialLocation)
        let annotation = MKPointAnnotation()
        annotation.coordinate   = location
        annotation.title        = "ecole 42"
        annotation.subtitle     = "addresse"
        Map.addAnnotation(annotation)
        
        let annotationmaison = MKPointAnnotation()
        annotationmaison.coordinate = CLLocationCoordinate2D(latitude: 43.4333, longitude: 6.6333)
        annotationmaison.title        = "MAISON"
        annotationmaison.subtitle     = "addresse"
        Map.addAnnotation(annotationmaison)
        
        let annotationlimoge = MKPointAnnotation()
        annotationlimoge.coordinate = CLLocationCoordinate2D(latitude: 45.85, longitude: 1.25)
        annotationlimoge.title        = "limoge"
        annotationlimoge.subtitle     = "addresse"
        Map.addAnnotation(annotationlimoge)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let initialLocation = CLLocation(latitude: 48.896592, longitude: 2.318373)
    
    let regionRadius: CLLocationDistance = 1000
    
    func centerMapOnLocation(location: CLLocation)
    {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        Map.setRegion(coordinateRegion, animated: true)
    }
    
    let location = CLLocationCoordinate2D(
        latitude: 48.896592,
        longitude: 2.318373)
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        mylocation = locations[0]
    }
}

