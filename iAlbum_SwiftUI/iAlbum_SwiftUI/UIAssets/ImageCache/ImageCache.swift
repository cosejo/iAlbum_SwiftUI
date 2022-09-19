//
//  ImageCache.swift
//  iAlbum_SwiftUI
//
//  Created by Carlos Osejo on 19/9/22.
//

import UIKit

class ImageCache: ObservableObject {
    var cache = NSCache<NSString, UIImage>()
    
    func get(forKey: String) -> UIImage? {
        return cache.object(forKey: NSString(string: forKey))
    }
    
    func set(forKey: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: forKey))
    }
}
