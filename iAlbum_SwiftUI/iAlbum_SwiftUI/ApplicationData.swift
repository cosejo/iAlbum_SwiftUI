//
//  ApplicationData.swift
//  iAlbum_SwiftUI
//
//  Created by Carlos Osejo on 14/9/22.
//

import Foundation

class ApplicationData: ObservableObject {
    @Published var userData: [PhotoViewModel]
    
    init() {
        userData = [
            PhotoViewModel(photo: Photo(albumId: 1, id: 1, title: "mail", url: "", thumbnailUrl: "")),
            PhotoViewModel(photo: Photo(albumId: 1, id: 2, title: "car", url: "", thumbnailUrl: "")),
            PhotoViewModel(photo: Photo(albumId: 1, id: 3, title: "wifi", url: "", thumbnailUrl: "")),
            PhotoViewModel(photo: Photo(albumId: 1, id: 4, title: "house", url: "", thumbnailUrl: "")),
            PhotoViewModel(photo: Photo(albumId: 1, id: 5, title: "pc", url: "", thumbnailUrl: "")),
            PhotoViewModel(photo: Photo(albumId: 1, id: 6, title: "smoke", url: "", thumbnailUrl: "")),
            PhotoViewModel(photo: Photo(albumId: 1, id: 7, title: "trash", url: "", thumbnailUrl: ""))
        ]
    }
}
