//
//  StringExtension.swift
//  iAlbum_SwiftUI
//
//  Created by Carlos Osejo on 19/9/22.
//

import Foundation

extension String {
  var localized: String {
        NSLocalizedString(self, comment: " ")
    }
}
