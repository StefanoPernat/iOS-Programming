//
//  ImageStore.swift
//  Homepwner
//
//  Created by Stefano Pernat on 12/11/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import UIKit

class ImageStore {
    let cache = NSCache<NSString, UIImage>()
    
    func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
    
    func image(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
    
    func delete(forKey key: String) {
        cache.removeObject(forKey: key as NSString)
    }
}
