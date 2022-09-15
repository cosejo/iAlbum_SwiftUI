//
//  PhotoGridCell.swift
//  iAlbum_SwiftUI
//
//  Created by Carlos Osejo on 14/9/22.
//

import SwiftUI

struct PhotoGridCell: View {
    @State var imageName = ""
    
    var body: some View {
        ZStack {
            Color.white
                .frame(width: .infinity, height: .infinity, alignment: .center)
                .shadow(radius: 5)
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .padding(.all, 10)
        }
    }
}

struct PhotoGridCell_Previews: PreviewProvider {
    static var previews: some View {
        PhotoGridCell()
    }
}
