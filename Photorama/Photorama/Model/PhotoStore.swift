//
//  PhotoStore.swift
//  Photorama
//
//  Created by Stefano Pernat on 27/11/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import UIKit

enum ImageResult {
    case success(UIImage)
    case failure(Error)
}

enum PhotoError: Error {
    case ImageCreationError
}

enum PhotoResult {
    case success([Photo])
    case failure(Error)
}

class PhotoStore {
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    // MARK: - process data from webserver
    private func processPhotoRequest(data: Data?, error: Error?) -> PhotoResult {
        guard let jsonData = data else {
            return .failure(error!)
        }
        
        return FlickrAPI.photos(fromJSON: jsonData)
    }
    
    // MARK: - Fetching methods
    func fetchInterestingPhotos(completition: @escaping (PhotoResult) -> Void) {
        let url = FlickrAPI.interestingPhotos
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            
            let result = self.processPhotoRequest(data: data, error: error)
            completition(result)
        }
        task.resume()
    }
    
    func fetchImage(for photo: Photo, completition: @escaping (ImageResult) -> Void) {
        let photoURL = photo.remoteUrl
        let request = URLRequest(url: photoURL)
        
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            
        }
        task.resume()
    }
}
