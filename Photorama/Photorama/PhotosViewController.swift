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
            [unowned self] (photosResult) -> Void in
            
            switch photosResult {
            case let .success(photos):
                print("Successfully found \(photos.count) photos")
                if let firtstPhoto = photos.first {
                    self.updateImageView(for: firtstPhoto)
                }
            case let .failure(error):
                print("Error fetching interesting photos: \(error)")
            
            }
        }
    }
    
    func updateImageView(for photo: Photo) {
        store.fetchImage(for: photo) {
            [unowned self ] imageResult -> Void in
            
            switch imageResult {
            case let .success(image):
                self.imageView.image = image
            case let .failure(error):
                print("Error downloading image: \(error)")
            }
        }
    }
}
