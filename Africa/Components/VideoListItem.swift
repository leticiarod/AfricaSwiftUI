//
//  VideoListItem.swift
//  Africa
//
//  Created by Leticia Rodriguez on 7/20/21.
//

import SwiftUI

struct VideoListItem: View {
    
    let video: Video
    
    var body: some View {
        HStack {
            ZStack {
                Image("video-\(video.id)")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .cornerRadius(9)
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .cornerRadius(4)
            } //: ZSTACK
            
            VStack(alignment: .leading, spacing: 10) {
                
            }
            
        } //: HSTACK
        
    }
}

struct VideoListItem_Previews: PreviewProvider {
    static let videos: [Video] = Bundle.main.decode("videos.json")
    static var previews: some View {
        VideoListItem(video: videos[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
