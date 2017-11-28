//
//  Photo.swift
//  Photorama
//
//  Created by Stefano Pernat on 28/11/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import Foundation

class Photo {
    let id: String
    let title: String
    let dateTaken: Date
    let remoteUrl: URL
    
    init(id: String, title: String, dateTaken: Date, remoteUrl: URL) {
        self.id         = id
        self.title      = title
        self.dateTaken  = dateTaken
        self.remoteUrl  = remoteUrl
    }
    
}
