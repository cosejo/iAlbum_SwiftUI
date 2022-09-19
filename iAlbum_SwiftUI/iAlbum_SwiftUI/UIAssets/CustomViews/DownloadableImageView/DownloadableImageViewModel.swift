//
//  DownloadableImageViewModel.swift
//  iAlbum_SwiftUI
//
//  Created by Carlos Osejo on 15/9/22.
//

import Foundation
import SwiftUI

class DownloadableImageViewModel: ObservableObject {
    
    public var networkManager: NetworkManager
    public var imageCache: ImageCache?
    
    @Published var image: UIImage
    @Published var error = false
    
    init(networkManager: NetworkManager = IAlbumNetworkManager(), imageCache: ImageCache?) {
        self.networkManager = networkManager
        self.imageCache = imageCache
        image = UIImage()
    }
    
    func downloadImage(_ urlString: String) {
        guard let url = URL(string: urlString) else {
            error = true
            return
        }
        
        image = UIImage()
        
        if let cachedImage = imageCache?.get(forKey: urlString) {
            self.image = cachedImage
            return
        }
        
        networkManager.downloadImage(url) { [weak self] data, error in
            guard let self = self,
                  let data = data,
                  let downloadImage = UIImage(data: data) else {
                self?.error = true
                return
            }
            
            DispatchQueue.main.async {
                self.image = downloadImage
            }
            
            self.imageCache?.set(forKey: urlString, image: downloadImage)
        }
    }
    
    func cancelLoadingImage() {
        networkManager.cancelLoadingImage()
    }
}
