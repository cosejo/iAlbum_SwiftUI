//
//  PhotoDetailView.swift
//  iAlbum_SwiftUI
//
//  Created by Carlos Osejo on 14/9/22.
//

import SwiftUI

struct PhotoDetailView: View {
    @State var imageName = "pencil"
    
    var body: some View {
        PhotoGridCell(imageName: imageName)
            .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding()
    }
}

struct PhotoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoDetailView()
    }
}
