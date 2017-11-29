//
//  PhotosViewController.swift
//  Photorama
//
//  Created by Stefano Pernat on 26/11/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import UIKit

class PhotosViewController : UIViewController {
    
    // MARK: - Variables
    var store: PhotoStore!
    
    // MARK: - Outlets
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchInterestingPhotos {
            (photosResult) -> Void in
            
            switch photosResult {
            case let .success(photos):
                print("Successfully found \(photos.count) photos")
            case let .failure(error):
                print("Error fetching interesting photos: \(error)")
            
            }
        }
    }
}
