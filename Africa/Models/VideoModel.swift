//
//  VideoModel.swift
//  Africa
//
//  Created by Leticia Rodriguez on 7/20/21.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // Computed property
    var thumbnail: String {
        "video-\(id)"
    }
    
}
