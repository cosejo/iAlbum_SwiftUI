//
//  iAlbum_SwiftUIApp.swift
//  iAlbum_SwiftUI
//
//  Created by Carlos Osejo on 14/9/22.
//

import SwiftUI

@main
struct iAlbum_SwiftUIApp: App {
    @StateObject var appData = ApplicationData()
    @StateObject var imageCache = ImageCache()
    
    var body: some Scene {
        WindowGroup {
            PhotoListView()
                .environmentObject(imageCache)
        }
    }
}
