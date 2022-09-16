//
//  SwiftUIView.swift
//  iAlbum_SwiftUI
//
//  Created by Carlos Osejo on 15/9/22.
//

import SwiftUI

struct DownloadableImageView: View {
    var urlString: String
    
    @ObservedObject var viewModel = DownloadableImageViewModel()
    @State var image: UIImage = UIImage()
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
            .onReceive(viewModel.$image) { image in
                self.image = image
            }
            .onAppear {
//                self.image = UIImage(systemName: "trash")!
                viewModel.downloadImage(urlString)
            }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadableImageView(urlString: "https://via.placeholder.com/600/771796")
    }
}
