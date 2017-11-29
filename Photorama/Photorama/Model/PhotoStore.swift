//
//  PhotoStore.swift
//  Photorama
//
//  Created by Stefano Pernat on 27/11/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import Foundation

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
}
