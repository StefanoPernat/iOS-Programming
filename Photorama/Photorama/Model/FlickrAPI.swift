//
//  FlickrAPI.swift
//  Photorama
//
//  Created by Stefano Pernat on 26/11/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import Foundation

enum FlickrError: Error {
    case invalidJSONData
}

enum Method: String {
    case interestingPhotos  = "flickr.interestingness.getList"
    case recentPhotos       = "flickr.photos.getRecent"
    
}

struct FlickrAPI {
    // MARK: - Type methods and variable
    private static let baseURLString = "https://api.flickr.com/services/rest"
    private static let apiKey = "a6d819499131071f158fd740860a5a88"
    
    // MARK: - formatters
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    
    // this method will build the requested url based on method
    // with the specified parameters
    // MARK: - building URL core method
    private static func flickrURL(method: Method,
                                  parameters: [String: String]?) -> URL {
        
        // url components is set initially to the base URL
        var components = URLComponents(string: baseURLString)!
        var queryItems = [URLQueryItem]()
        
        let commonQueryItems = [
            "method": method.rawValue,
            "format": "json",
            "nojsoncallback": "1",
            "api_key": apiKey
        ]
        
        for (key, value) in commonQueryItems {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        if let additionalParameters = parameters {
            for (key, value) in additionalParameters {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        
        components.queryItems = queryItems
        return components.url!
    }
    
    // MARK: - built URLs
    static var interestingPhotos: URL {
        return flickrURL(method: .interestingPhotos,
                         parameters: ["extras": "url_h,date_taken"])
    }
    
    static var recentPhotos: URL {
        return flickrURL(method: .recentPhotos,
                         parameters: ["extras": "url_h,date_taken"])
    }
    
    // Parsing json and get a Photo Array
    // MARK: - From JSON to photo/s
    
    private static func photo(fromJSON json: [String: Any]) -> Photo? {
        guard
            let id = json["id"] as? String,
            let title = json["title"] as? String,
            let dateString = json["datetaken"] as? String,
            let photoURLString = json["url_h"] as? String,
            let url = URL(string: photoURLString),
            let dateTaken = dateFormatter.date(from: dateString) else {
                return nil
        }
        
        return Photo(id: id, title: title, dateTaken: dateTaken, remoteUrl: url)
    }
    
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
            for photoJSON in photosArray {
                if let photo = photo(fromJSON: photoJSON) {
                    finalPhotos.append(photo)
                }
            }
            
            if finalPhotos.isEmpty && !photosArray.isEmpty {
                return .failure(FlickrError.invalidJSONData)
            }
            
            return .success(finalPhotos)
        } catch let error {
            return .failure(error)
        }
    }
}
