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
    case imageCreationError
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
    
    let imageStore = ImageStore()
    
    // MARK: - process data from webserver
    private func processPhotoRequest(data: Data?, error: Error?) -> PhotoResult {
        guard let jsonData = data else {
            return .failure(error!)
        }
        
        return FlickrAPI.photos(fromJSON: jsonData)
    }
    
    private func processImageRequest(data: Data?, error: Error?) -> ImageResult {
        guard
            let imageData = data,
            let image = UIImage(data: imageData) else {
                if data == nil {
                    return .failure(error!)
                } else {
                    return .failure(PhotoError.imageCreationError)
                }
        }
        
        return .success(image)
    }
    
    // MARK: - Fetching methods
    func fetchInterestingPhotos(completition: @escaping (PhotoResult) -> Void) {
        let url = FlickrAPI.interestingPhotos
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            //let httpResponse = response as! HTTPURLResponse
            //print("fetching interesting photos json response:\nstatusCode:\(httpResponse.statusCode)\n\(httpResponse.allHeaderFields)")
            
            let result = self.processPhotoRequest(data: data, error: error)
            OperationQueue.main.addOperation {
                completition(result)
            }
        }
        task.resume()
    }
    
    func fetchRecentPhotos(completition: @escaping (PhotoResult) -> Void) {
        let url = FlickrAPI.recentPhotos
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            
            let result = self.processPhotoRequest(data: data, error: error)
            OperationQueue.main.addOperation {
                completition(result)
            }
        }
        task.resume()
    }
    
    func fetchImage(for photo: Photo, completition: @escaping (ImageResult) -> Void) {
        let photoURL = photo.remoteUrl
        let request = URLRequest(url: photoURL)
        let photoKey = photo.id
        
        if let image = imageStore.image(forKey: photoKey) {
            OperationQueue.main.addOperation {
                completition(.success(image))
            }
            return
        }
        
        let task = session.dataTask(with: request) {
            [unowned self] (data, response, error) -> Void in
            
            let result = self.processImageRequest(data: data, error: error)
            
            if case let .success(image) = result {
                self.imageStore.setImage(image, forKey: photoKey)
            }
            
            OperationQueue.main.addOperation {
                completition(result)
            }
        }
        task.resume()
    }
}
