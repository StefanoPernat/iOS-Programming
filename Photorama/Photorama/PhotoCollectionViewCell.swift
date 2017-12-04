//
//  PhotoCollectionViewCell.swift
//  Photorama
//
//  Created by Stefano Pernat on 03/12/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    // MARK: - Outlets
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    // MARK: - Helper methods
    func update(with image: UIImage?) {
        if let imageToDisplay = image {
            spinner.stopAnimating()
            imageView.image = imageToDisplay
        } else {
            spinner.startAnimating()
            imageView.image = nil
        }
    }
    
    // MARK: - callback methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        update(with: nil)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        update(with: nil)
    }
}
