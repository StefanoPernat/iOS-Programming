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
    var photoDataSource = PhotoDataSource()
    
    // MARK: - Outlets
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = photoDataSource
        
        store.fetchInterestingPhotos {
            [unowned self] (photosResult) -> Void in
            
            switch photosResult {
            case let .success(photos):
                print("Successfully found \(photos.count) photos")
                self.photoDataSource.photos = photos
            case let .failure(error):
                print("Error fetching interesting photos: \(error)")
                self.photoDataSource.photos.removeAll()
            }
            self.collectionView.reloadSections(IndexSet(integer: 0))
        }
    }
}
