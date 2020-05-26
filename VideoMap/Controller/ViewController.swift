//
//  ViewController.swift
//  VideoMap
//
//  Copyright © 2020 Jak. All rights reserved.
//
//  This class represents the root view controller, it displays the world map.
//


import UIKit
import MapKit
import AVKit
import AVFoundation

class ViewController: UIViewController, MKMapViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var showAllVideosButton: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var insertedText: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var passwordRequest: UIStackView!
    @IBOutlet weak var searchButton: UIBarButtonItem!
    @IBOutlet weak var selectedMapStyle: UISegmentedControl!
    
    
    let search = SearchVideo()
    var playerViewController = AVPlayerViewController()
    var player: AVPlayer?
    
    // Creates all videos.
    let videos = Video.createVideos()
    
    // Creates all annotations.
    var annotationsList = [Annotation]()
    
    // Creates password for locked videos.
    let password = "llas"
    
    var requestedVideo: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mapView.delegate = self
        
        // Register my custom annotation view class.
        mapView.register(AnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        // Sets the map over Florence.
        let florenceLocation = CLLocationCoordinate2D(latitude: 43.769810, longitude: 11.255403)
        centerLocation(florenceLocation, 500000)
        
        // Creates all annotations.
        annotationsList = Annotation.createAnnotations(videos)
        
        // Adds all the annotations to the map.
        mapView.addAnnotations(annotationsList)
        
        // Changes the corners of the "All Videos" button.
        showAllVideosButton.layer.cornerRadius = 8
        
        // Changes the corners of the password view's elements.
        enterButton.layer.cornerRadius = 8
        passwordView.layer.cornerRadius = 8
        
    }

    // Sets the navigation bar hidden in this view and locks the interface in portrait mode.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AppUtility.lockOrientation(.portrait)
    }
    
    // Centers the map to the requested location within a specified distance.
    func centerLocation(_ location: CLLocationCoordinate2D, _ regionRadius: CLLocationDistance) {
        let region = MKCoordinateRegion(center: location, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(region, animated: true)
    }
    
    // Sets the play button's action of the annotation: selects and loads the video requested by the user.
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let selectedVideo = view.annotation?.title else {
            return
        }
        let lock = Video.getVideoLock(selectedVideo!, videos)
        requestedVideo = selectedVideo!
        if lock {
            enablePasswordView()
        } else {
            playVideo(selectedVideo!)
        }
    }
    
    // Sets the password view's enter button action.
    @IBAction func enterTapped(_ sender: Any) {
        if insertedText.text == password {
            disablePasswordView()
            playVideo(requestedVideo!)
        } else if insertedText.text == "psspsctt" {
            showAlert("NOPE", "Così troppo facile non credi?")
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
            insertedText.text = ""
        } else {
            insertedText.shake()
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
            insertedText.text = ""
        }
    }
    
    // Loads and plays the selected video.
    func playVideo(_ selectedVideo: String) {
        let videoPath = Bundle.main.path(forResource: selectedVideo, ofType: "mp4")
        let videoURL = URL(fileURLWithPath: videoPath!)
        player = AVPlayer(url: videoURL)
        playerViewController.player = player
        self.present(playerViewController, animated: true, completion: self.playerViewController.player?.play)
    }
    
    // When tapping outside the password request view, that view will disappear.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        passwordView.tag = 1
        passwordRequest.tag = 2
        if passwordView.isHidden {
            return
        } else {
            let touch: UITouch? = touches.first
            if  touch?.view?.tag != 1 && touch?.view?.tag != 2 {
                disablePasswordView()
            }
        }
    }
    
    // Manages the view when the password view appears.
    func enablePasswordView() {
        passwordView.isHidden = false
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        mapView.addBlur()
        selectedMapStyle.isHidden = true
    }
    
    // Manages the view when the password view disappears.
    func disablePasswordView() {
        passwordView.isHidden = true
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        insertedText.resignFirstResponder()
        mapView.removeBlur()
        insertedText.text = ""
        selectedMapStyle.isHidden = false
    }
    
    // Shows an alert with given title and message.
    func showAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // Shows the search bar when tapping on the search icon.
    @IBAction func searchToShow(_ sender: Any) {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search for a video"
        self.present(searchController, animated: true, completion: nil)
    }
    
    // Manages the research.
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        var videoSelected: String?
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        do {
            videoSelected = try search.searchVideo(searchBar.text!, videos)
        } catch SearchingError.noText {
            videoSelected = nil
            showAlert("Enter some text", "")
        } catch SearchingError.noMatchFound {
            videoSelected = nil
            showAlert("No match found", "")
        } catch {
            print("Some other errors")
        }
        if let actualVideo = videoSelected {
            centerLocation(Video.getVideoLocation(actualVideo, videos), 50000)
        } else {
            showAlert("Enter some text", "")
        }
    }
    
    // Sets the style of the map.
    @IBAction func setMapStyle(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        default:
            mapView.mapType = .standard
        }
    }
    
}

