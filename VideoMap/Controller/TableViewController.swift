//
//  TableViewController.swift
//  VideoMap
//
//  Copyright © 2020 Jak. All rights reserved.
//
//  This class represents the view controller used for the table view of the videos.
//


import Foundation
import UIKit
import AVKit
import AVFoundation

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var sortingControl: UISegmentedControl!
    @IBOutlet weak var orderControl: UISegmentedControl!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordRequest: UIStackView!
    @IBOutlet weak var insertedText: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    
    var videos = Video.createVideos()
    let sort = SortVideos()
    
    var playerViewController = AVPlayerViewController()
    var player: AVPlayer?
    
    // Creates password for locked videos.
    let password = "llas"
    
    var selectedIndexPath = IndexPath()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        
        // Sets large title.
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Sort the videos by title, from A to Z.
        videos = sort.sortAZ(videos)
        
        // Changes the corners of the password view's elements.
        passwordView.layer.cornerRadius = 8
        enterButton.layer.cornerRadius = 8
        
    }
    
    // Sets the navigation bar visible in this view and locks the interface in portrait mode.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        AppUtility.lockOrientation(.portrait)
    }
    
    // Selects the spefic sorting algorithm requested by the user.
    @IBAction func sortingRequest(_ sender: Any) {
        if sortingControl.selectedSegmentIndex == 0 && orderControl.selectedSegmentIndex == 0 {
            videos = sort.sortAZ(videos)
            scrollAndReload()
        } else if sortingControl.selectedSegmentIndex == 0 && orderControl.selectedSegmentIndex == 1 {
            videos = sort.sortZA(videos)
            scrollAndReload()
        } else if sortingControl.selectedSegmentIndex == 1 && orderControl.selectedSegmentIndex == 0 {
            videos = sort.sortRecent(videos)
            scrollAndReload()
        } else {
            videos = sort.sortOlder(videos)
            scrollAndReload()
        }
    }
    
    
    // Reloads the elements of the table view and scrolls to the top.
    func scrollAndReload() {
        let topIndex = IndexPath(row: 0, section: 0)
        self.table.scrollToRow(at: topIndex, at: .top, animated: true)
        self.table.reloadData()
    }
    
    
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideosList", for: indexPath) as! TableViewCellDesign
        cell.video = videos[indexPath.row]
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedVideo = videos[indexPath.row]
        let lock = selectedVideo.lock
        if lock {
            enablePasswordView()
            selectedIndexPath = indexPath
        } else {
            playVideo(at: indexPath)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Sets the password view's enter button action.
    @IBAction func enterTapped(_ sender: Any) {
        if insertedText.text == password {
            disablePasswordView()
            playVideo(at: selectedIndexPath)
        } else if insertedText.text == "psspsctt" {
            showAlert()
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
            insertedText.text = ""
        } else {
            insertedText.shake()
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
            insertedText.text = ""
        }
    }
    
    // Selects and loads the video requested by the user.
    func playVideo(at indexPath: IndexPath) {
        let selectedVideo = videos[indexPath.row]
        let videoPath = Bundle.main.path(forResource: selectedVideo.title, ofType: "mp4")
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
        self.addBlur()
        self.view.bringSubviewToFront(passwordView)
        passwordView.isHidden = false
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // Manages the view when the password view disappears.
    func disablePasswordView() {
        passwordView.isHidden = true
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        insertedText.resignFirstResponder()
        self.removeBlur()
        insertedText.text = ""
    }
    
    // Shows an alert in that specific case ;).
    func showAlert() {
        let alert = UIAlertController(title: "NOPE", message: "Così troppo facile non credi?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
