//
//  TableViewCellDesign.swift
//  VideoMap
//
//  Copyright © 2020 Jak. All rights reserved.
//
//  This class manages the view of the cell of the UITableView.
//

import Foundation
import UIKit

class TableViewCellDesign: UITableViewCell {
    
    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoDate: UILabel!
    
    var video: Video! {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        videoImage.image = UIImage(named: video.image)
        videoImage.layer.cornerRadius = 8
        videoImage.layer.masksToBounds = true
        videoTitle.text = video.title
        videoDate.text = "\(video.date)"
    }
}

