//
//  ListVC.swift
//  MapDemo
//
//  Created by CE Info on 27/07/18.
//  Copyright © 2018 MMI. All rights reserved.
//

import UIKit
import MapmyIndiaAPIKit

class ListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblVwList: UITableView!
    
    @objc var routeAdvices = [MapmyIndiaTripAdvice]()
    
    @objc var placemark: MapmyIndiaPlacemark?
    
    let listArr:[String]? = ["Road Traffic Details","Geofence UI", "Geoanalytics", "MapStyle", "DrivingRange", "Nearby Report", "Zoom Level", "Zoom Level With Animation", "Center With Animation", "Current Location","Tracking Mode", "Add Marker", "Add Multiple Markers With Bounds", "Custom Marker", "Animate Marker", "Draggable Marker", "Clustering Markers", "Interactive Markers", "Polyline", "Multiple Polylines", "Polygons", "Circles", "Update Circle", "Autosuggest", "Geocoding (Forward Geocode)", "Atlas Geocode", "Reverse Geocoding", "Nearby Search", "Place/eLoc Detail Legacy", "Place Detail", "Driving Distance", "Distance Matrix", "Distance Matrix ETA", "Distance Matrix Elocs", "Route", "Route Advance", "Route Advance ETA", "Routing/Directions", "Feedback", "GeoJson Multiple Shapes", "Dashed Polyline", "Geodesic Polyline", "Interior Polygons", "Default Indoor", "Custom Indoor", "Point On Map", "Safety Plugin", "Covid Layers", "COVID-19 Safety Status", "Place Picker", "POI along the Route", "Autosuggest Widget", "DirectionUI Plugin","Nearby UI"]
    
    var placeDetails = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if routeAdvices.count > 0 {
            self.navigationItem.title = "Advices"
        }
        else if let place = placemark {
            self.navigationItem.title = "Place Detail"
            placeDetails = ["House Number: \(place.houseNumber ?? "")", "House Name: \(place.houseName ?? "")", "POI: \(place.poi ?? "")", "Street: \(place.street ?? "")", "Sub Sub Locality: \(place.subSubLocality ?? "")", "Sub Locality: \(place.subLocality ?? "")", "Locality: \(place.locality ?? "")", "Village: \(place.village ?? "")", "District: \(place.district ?? "")", "Sub District: \(place.subDistrict ?? "")", "City: \(place.city ?? "")", "State: \(place.state ?? "")", "Pincode: \(place.pincode ?? "")", "Latitude: \(place.latitude ?? "")", "Longitude: \(place.longitude ?? "")", "PlaceId: \(place.placeId ?? "")", "Type: \(place.type ?? "")"]
        }
        else {
            self.navigationItem.title = "Swift"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if routeAdvices.count > 0 {
            return routeAdvices.count
        }
        else if placeDetails.count > 0 {
            return placeDetails.count
        }
        else {
            return listArr?.count ?? 0
        }
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if routeAdvices.count > 0 {
            let advice = routeAdvices[indexPath.row]
            cell.textLabel?.text = "\(advice.text ?? "")"
        }
        else if placeDetails.count > 0 {
            cell.textLabel?.text = placeDetails[indexPath.row]
        }
        else {
            cell.textLabel?.text = listArr?[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if routeAdvices.count > 0 {
            
        }
        else if placeDetails.count > 0 {
            
        }
        else {
            print("You tapped cell number \(indexPath.row).")
            let strType = listArr![indexPath.row]
            switch strType {
            case "Interior Polygons":
                //let vc = InteriorPolygonExample_Swift(nibName: nil, bundle: nil)
                let vc = HighlightPointExample_Swift(nibName: nil, bundle: nil)
                self.navigationController?.pushViewController(vc, animated: true)
                break
            case "GeoJson Multiple Shapes":
                let vc = MultipleShapesExample_Swift(nibName: nil, bundle: nil)
                self.navigationController?.pushViewController(vc, animated: true)
                break
            case "Dashed Polyline":
                let vc = DashedPolylineExample_Swift(nibName: nil, bundle: nil)
                self.navigationController?.pushViewController(vc, animated: true)
                break
            case "Clustering Markers":
                let vc = ClusterMarkersExample_Swift(nibName: nil, bundle: nil)
                self.navigationController?.pushViewController(vc, animated: true)
                break
            case "Geodesic Polyline":
                let vc = GeodesicPolylineExample_Swift(nibName: nil, bundle: nil)
                self.navigationController?.pushViewController(vc, animated: true)
                break
            case "Custom Indoor":
                let vctrl = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CustomIndoorVC") as? CustomIndoorVC
                self.navigationController?.pushViewController(vctrl!, animated: true)
                vctrl?.strType = strType
                break
            case "Default Indoor":
                let vctrl = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DefaultIndoorVC") as? DefaultIndoorVC
                self.navigationController?.pushViewController(vctrl!, animated: true)
                vctrl?.strType = strType
                break
            case "Interactive Markers":
                let vctrl = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InteractiveMarkerVC") as? InteractiveMarkerVC
                self.navigationController?.pushViewController(vctrl!, animated: true)
                vctrl?.strType = strType
                break
            case "Point On Map":
                let vctrl = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PointOnMapVC") as? PointOnMapVC
                self.navigationController?.pushViewController(vctrl!, animated: true)
                vctrl?.strType = strType
                break
            case "Safety Plugin":
                let vctrl = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SafetyPluginVC") as? SafetyPluginVC
                self.navigationController?.pushViewController(vctrl!, animated: true)
                break
            case "Draggable Marker":
                let vc = DraggableMapMarkerVC_Swift(nibName: nil, bundle: nil)
                self.navigationController?.pushViewController(vc, animated: true)
                break
            case "Update Circle":
                let vc = UpdateCircleExample_Swift(nibName: nil, bundle: nil)
                self.navigationController?.pushViewController(vc, animated: true)
                break
            case "Multiple Polylines":
                let vc = MultiplePolylinesExample_Swift(nibName: nil, bundle: nil)
                self.navigationController?.pushViewController(vc, animated: true)
                break
            case "Covid Layers":
                if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CovidLayersExample") as? CovidLayersExample_Swift {
                    self.navigationController?.pushViewController(vc, animated: true)
                }
                break
            case "COVID-19 Safety Status":
                if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CovidSafetyStatusExample") as? CovidSafetyStatusExample_Swift {
                    self.navigationController?.pushViewController(vc, animated: true)
                }
                break
            case "Place Picker":
                let vc = PlacePickerViewExampleLauncherVC(nibName: nil, bundle: nil)
                self.navigationController?.pushViewController(vc, animated: true)
                break
                
            case "POI along the Route":
                let vc = POIsAlongTheRouteVC(nibName: nil, bundle: nil)
                self.navigationController?.pushViewController(vc, animated: true)
            case "Autosuggest Widget":
                let vc = AutosuggestWidgetExamplesLauncherVC(nibName: nil, bundle: nil)
                self.navigationController?.pushViewController(vc, animated: true)
                break
            case "Distance Matrix Elocs":
                let vc = DistanceMatrixViewController()
                self.navigationController?.pushViewController(vc, animated: true)
                break
            case "Routing/Directions":
                let vc = DirectionsViewController()
                self.navigationController?.pushViewController(vc, animated: true)
                break
            case "DirectionUI Plugin":
                let vC = DirectionUIViewController()
                self.navigationController?.pushViewController(vC, animated: false)
                break
            case "Nearby UI":
                let vC = NearbyViewControllerLauncher()
                self.navigationController?.pushViewController(vC, animated: false)
            case "Geofence UI":
                let geofenceUILVC = GeofenceUILunchVC()
                self.navigationController?.pushViewController(geofenceUILVC, animated: false)
                
            case "Geoanalytics":
                let geoanalytics = MapmyIndiaGeoanalyticsViewController()
                geoanalytics.title = "Geoanalytics"
                self.navigationController?.pushViewController(geoanalytics, animated: false)
            case "MapStyle":
                let mapStyleVC = MapmyIndiaMapStyleViewController()
                mapStyleVC.title = "Map style"
                self.navigationController?.pushViewController(mapStyleVC, animated: false)
            case "DrivingRange":
                let drivingRangeVC = DrivingRangeSampleViewController()
                drivingRangeVC.title = "Driving Range"
                self.navigationController?.pushViewController(drivingRangeVC, animated: false)
            case "Road Traffic Details":
                let roadTrafficDetails = RoadTrafficDetailsViewController()
                roadTrafficDetails.title = "Road Traffic Details"
                self.navigationController?.pushViewController(roadTrafficDetails, animated: false)
            case "Nearby Report":
                let nearbyReport = MapmyIndiaNearbyReportViewController()
                nearbyReport.title = "Nearby Report"
                self.navigationController?.pushViewController(nearbyReport, animated: false)
            default:
                let vctrl = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mapVC") as? mapVC
                self.navigationController?.pushViewController(vctrl!, animated: true)
                vctrl?.strType = strType
                break
                }
            }
        }
    }



