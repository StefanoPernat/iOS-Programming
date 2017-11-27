//
//  FlickrAPI.swift
//  Photorama
//
//  Created by Stefano Pernat on 26/11/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import Foundation

enum Method: String {
    case interestingPhotos = "flickr.interestingness.getList"
}

struct FlickrAPI {
    // MARK: - Type methods and variable
    private static let baseURLString = "https://api.flickr.com/services/rest"
    private static let apiKey = "a6d819499131071f158fd740860a5a88"
    
    // this method will build the requested url based on method
    // with the specified parameters
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
}
