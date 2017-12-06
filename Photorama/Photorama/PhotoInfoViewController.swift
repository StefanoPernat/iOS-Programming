//
//  PhotoInfoViewController.swift
//  Photorama
//
//  Created by Stefano Pernat on 05/12/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import UIKit

class PhotoInfoViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet var imageView: UIImageView!
    
    // MARK - Variables
    var store: PhotoStore!
    var photo: Photo! {
        didSet {
            navigationItem.title = photo.title
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchImage(for: photo) {
            [unowned self] (result) -> Void in
            
            switch result {
            case let .success(image):
                self.imageView.image = image
            case let .failure(error):
                print("Error fetching image for photo: \(error)")
            }
        }
    }
}
