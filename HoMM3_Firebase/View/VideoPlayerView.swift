//
//  VideoPlayerView.swift
//  HoMM3_Firebase
//
//  Created by Maxim Mitin on 12.09.22.
//

import SwiftUI
import AVKit

struct VideoPlayerView: UIViewRepresentable {

    func makeUIView(context: Context) -> UIView {
        return PlauerUIView(frame: .zero)
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        //
    }
}

class PlauerUIView: UIView {
    private var playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        //Refs to video
        let fileUrl = Bundle.main.url(forResource: "H3main_video", withExtension: "mp4")!
        let playerItem = AVPlayerItem(url: fileUrl)
        
        
        //Player set
        let player = AVQueuePlayer(playerItem: playerItem)
        playerLayer.player = player
        playerLayer.videoGravity = .resize
        layer.addSublayer(playerLayer)
        
        //Loop
        playerLooper = AVPlayerLooper(player: player, templateItem: playerItem)
        
        //Play
        player.play()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView()
    }
}
