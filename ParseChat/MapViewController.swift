//
//  MapViewController.swift
//  ParseChat
//
//  Created by Wade Li on 4/15/19.
//  Copyright © 2019 Wade Li. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Parse

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    let d: Double = 0.001
    var x: Double = 0.0
    var y: Double = 0.0
    var image: UIImage = UIImage(named: "photo-placeholder")!
    var nameF: String = ""
    var id: String?
    var locationManager = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mapView.showsUserLocation = true
        if CLLocationManager.locationServicesEnabled() == true{
            
            if CLLocationManager.authorizationStatus() == .denied ||
                CLLocationManager.authorizationStatus() == .restricted ||
                CLLocationManager.authorizationStatus() == .notDetermined{
                locationManager.requestWhenInUseAuthorization()
            }
            
            locationManager.desiredAccuracy = 1.0
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
            
            
        }else{
            
            print("please turn on location services")
            
        }
        mapView.delegate = self
    }
    //Mark:- CLLocationManager Delegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.0002, longitudeDelta: 0.0002))
        guard let coordinate: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        let query = PFQuery(className: "Info")
        query.whereKey("User", equalTo: PFUser.current()!)
        query.getFirstObjectInBackground { (objects: PFObject?, error: Error?) in
            if error != nil {
                let alertController = UIAlertController(title:"Error", message: "Fail to upload coordinates", preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                }
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion: nil)
                self.dismiss(animated: true, completion: nil)
            }
            else {
                query.getObjectInBackground(withId: objects!.objectId!) { (info: PFObject?, error: Error?) in
                    if let info = info {
                        self.id = objects!.objectId!
                        info["X"] = coordinate.latitude
                        self.x = coordinate.latitude
                        info["Y"] = coordinate.longitude
                        self.y = coordinate.longitude
                        info.saveInBackground()
                        if (self.x != 0.0 || self.y != 0.0) {
                            self.display()
                        }
                    }
                }
            }
        }
        self.mapView.setRegion(region, animated: true)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        print("unable to access your current location")
    }
    
    func display() {
        let query = PFQuery(className: "Info")
        query.selectKeys(["X", "Y", "Name", "Image"])
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                for object in objects! {
                    if object.objectId! == self.id {
                        continue
                    }
                    let xC: Double = object.object(forKey: "X") as! Double
                    let yC: Double = object.object(forKey: "Y") as! Double
                    let name: String = object.object(forKey: "Name") as! String
                    self.nameF = name
                    let imageF = object.object(forKey: "Image") as? PFFileObject
                    imageF?.getDataInBackground(block: { (iData: Data?, error: Error?) in
                        if error != nil {
                            print(error?.localizedDescription)
                        }
                        else if let iData = iData {
                            self.image = UIImage(data: iData)!
                        }
                    })
                    if (abs(xC - self.x) <= self.d && abs(yC - self.y) <= self.d) {
                        let a = MKPointAnnotation()
                        a.coordinate = CLLocationCoordinate2DMake(xC, yC)
                        a.title = name
                        self.mapView.addAnnotation(a)
                    }
                }
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
        //annotationView.image = image
        annotationView.image = UIImage(named: "find")
        let trans = CGAffineTransform(scaleX: 1, y: 1)
        annotationView.transform = trans
        annotationView.canShowCallout = true
        annotationView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        self.performSegue(withIdentifier: "Hi", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let NVC = segue.destination as! NewViewController
        NVC.pic = image
        NVC.name = nameF
    }
 
    @IBAction func onRelocate(_ sender: Any) {
        locationManager.startUpdatingLocation()
    }
    
}
