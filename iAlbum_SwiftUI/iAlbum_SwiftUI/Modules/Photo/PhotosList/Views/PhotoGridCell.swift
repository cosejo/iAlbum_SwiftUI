//
//  PhotoGridCell.swift
//  iAlbum_SwiftUI
//
//  Created by Carlos Osejo on 14/9/22.
//

import SwiftUI

struct PhotoGridCell: View {
    @State var urlString = ""
    
    var body: some View {
        ZStack {
            Color.white
                .shadow(radius: 5)
            DownloadableImageView(urlString: urlString)
        }
    }
}

struct PhotoGridCell_Previews: PreviewProvider {
    static var previews: some View {
        PhotoGridCell(urlString: "https://via.placeholder.com/600/771796")
    }
}
