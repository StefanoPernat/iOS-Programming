//
//  ImageStore.swift
//  Homepwner
//
//  Created by Stefano Pernat on 12/11/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import UIKit

class ImageStore {
    // MARK: - The real cache
    let cache = NSCache<NSString, UIImage>()
    
    // MARK: - build an url for every image in the cache
    // For saving the image associated with an item
    func imageURL(forKey key: String) -> URL {
        let documentDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentDirectories.first!
        
        return documentDirectory.appendingPathComponent(key)
    }
    
    // MARK: - methods to manipulate the cache (insert, delete and retrive)
    func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
        
        // Create a url for the image
        let url = imageURL(forKey: key)
        
        // Turn image into JPEG data
        if let data = UIImagePNGRepresentation(image) {
            // write it to the URL
            try? data.write(to: url, options: [.atomic])
        }
    }
    
    func image(forKey key: String) -> UIImage? {
        // check if image is in the cache
        if let existingImage = cache.object(forKey: key as NSString) {
            return existingImage
        }
        
        // retrive image from the file system
        let url = imageURL(forKey: key)
        guard let imageFromDisk = UIImage(contentsOfFile: url.path) else {
            return nil
        }
        
        cache.setObject(imageFromDisk, forKey: key as NSString)
        return imageFromDisk
    }
    
    func delete(forKey key: String) {
        cache.removeObject(forKey: key as NSString)
        
        // When an image is deleted remove it from the file system
        let url = imageURL(forKey: key)
        do {
            try FileManager.default.removeItem(at: url)
        } catch let deleteError {
            print("Error removing the image from disk: \(deleteError)")
        }
    }
}
