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
    
    @Published var image: UIImage = UIImage()
    
    init(networkManager: NetworkManager = IAlbumNetworkManager()) {
        self.networkManager = networkManager
    }
    
    func downloadImage(_ urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        networkManager.downloadImage(url) { [weak self] data, error in
            guard let self = self,
                  let data = data else {
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data) ?? UIImage()
            }
        }
    }
    
    func cancelLoadingImage() {
        networkManager.cancelLoadingImage()
    }
}
