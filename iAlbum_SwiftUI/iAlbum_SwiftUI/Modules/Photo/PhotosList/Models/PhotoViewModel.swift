//
//  PhotoViewModel.swift
//  iAlbum_SwiftUI
//
//  Created by Carlos Osejo on 15/9/22.
//

import Foundation

struct PhotoViewModel {
    let photo: Photo
    
    var id: Int {
        return photo.id
    }
    var imageURL: String {
        return photo.url
    }
    
    var thumbnailUrl: String {
        return photo.thumbnailUrl
    }
}
