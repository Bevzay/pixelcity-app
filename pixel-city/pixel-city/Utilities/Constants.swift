//
//  Constants.swift
//  pixel-city
//
//  Created by Beverly on 6/01/18.
//  Copyright © 2018 Beverly. All rights reserved.
//

import Foundation

let apiKey = "ba96844841a34eaf08cabfa48d59af0a"

func flickrUrl(forApiKey key: String, withAnnotation annotation: DroppablePin, numberOfPhotos number: Int) -> String {
    let url = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(apiKey)&lat=\(annotation.coordinate.latitude)&lon=\(annotation.coordinate.longitude)&radius=1&radius_units=km&per_page=\(number)&format=json&nojsoncallback=1"
    print(url)
    return url
}
