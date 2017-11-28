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
    
    // MARK: - PhotoStore static methods
    static func photos (fromJSON data: Data) -> PhotoResult {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            
            guard
                let jsonDictionary = jsonObject as? [AnyHashable: Any],
                let photos = jsonDictionary["photos"] as? [String: Any],
                let photosArray = photos["photo"] as? [[String: Any]]
            else {
                return .failure(FlickrError.invalidJSONData)
            }
            
            var finalPhotos = [Photo]()
            return .success(finalPhotos)
        } catch let error {
            return .failure(error)
        }
    }
    
    // MARK: - PhotoStore instance methods
    func fetchInterestingPhotos() {
        let url = FlickrAPI.interestingPhotos
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            
            if let jsonData = data {
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
                    print(jsonObject)
                } catch let error {
                    print("Error creating JSON object: \(error)")
                }
            } else if let requestError = error {
                print("Error fetching interesting photos: \(requestError)")
            } else {
                print("Unexpected error with the request")
            }
        }
        task.resume()
    }
}
