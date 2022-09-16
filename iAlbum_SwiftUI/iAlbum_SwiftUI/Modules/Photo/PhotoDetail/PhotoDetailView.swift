//
//  PhotoDetailView.swift
//  iAlbum_SwiftUI
//
//  Created by Carlos Osejo on 14/9/22.
//

import SwiftUI

struct PhotoDetailView: View {
    @State var urlString = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            PhotoGridCell(urlString: urlString)
                .frame(width: 150, height: 150, alignment: .center)
                .padding()
        })
    }
}

struct PhotoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoDetailView(urlString: "https://via.placeholder.com/600/771796")
    }
}
