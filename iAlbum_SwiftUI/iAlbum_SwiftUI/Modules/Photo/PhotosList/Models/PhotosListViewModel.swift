//
//  PhotosListViewModel.swift
//  iAlbum_SwiftUI
//
//  Created by Carlos Osejo on 15/9/22.
//

import Foundation

class PhotosListViewModel: ObservableObject {
    
    public let photosLimit = 21
    
    public var networkManager: NetworkManager
    
    @Published var photos: [PhotoViewModel] = []
    @Published var error = false
    
    init(networkManager: NetworkManager = IAlbumNetworkManager()) {
        self.networkManager = networkManager
    }
    
    func loadPhotos() {
        fetchPhotos(index: photos.count, limit: photosLimit)
    }
    
    func reloadPhotos() {
        let currentPhotosCount = photos.count
        photos = []
        fetchPhotos(index: photos.count, limit: currentPhotosCount, isReload: true)
    }
    
    func fetchPhotos(index: Int, limit: Int, isReload: Bool = false) {
        networkManager.getPhotos(index: index, limit: limit) { [weak self] newPhotos, error in
            if let addedPhotos = newPhotos {
                self?.photos.append(contentsOf: addedPhotos.map(PhotoViewModel.init))
            }
            
            self?.error = error != nil
        }
    }
}
