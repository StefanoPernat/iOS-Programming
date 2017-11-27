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
    
    // this method will build the requested url based on method
    // with the specified parameters
    private static func flickrURL(method: Method,
                                  parameters: [String: String]?) -> URL {
        return URL(string: "")!
    }
    
    // MARK: - built URLs
    static var interestingPhotos: URL {
        return flickrURL(method: .interestingPhotos,
                         parameters: ["extras": "url_h,date_taken"])
    }
}
