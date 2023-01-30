//
//  Player2.swift
//  radio
//
//  Created by Igor Guzei on 23.01.2023.
//

//  Тут будет попытка достать метаданные
//  AVPlayerItemMetadataOutput

import UIKit
import MediaPlayer

// class AVPlayerItemMetadataOutput : AVPlayerItemOutput
// class AVPlayerItemOutput : NSObject
// class AVPlayerItemTrack : NSObject
// class AVAssetTrack : NSObject
//  Loading Metadata
//      static var metadata: AVAsyncProperty<Root, [AVMetadataItem]>
//          An array of metadata items for all metadata identifiers that have a value.
//          Available when Root conforms to AVAssetTrack.
//      static var commonMetadata: AVAsyncProperty<Root, [AVMetadataItem]>
//          An array of metadata items for all common metadata keys that have a value.
//          Available when Root conforms to AVAssetTrack.
//      static var availableMetadataFormats: AVAsyncProperty<Root, [AVMetadataFormat]>
//          An array of metadata formats available for the track.
//          Available when Root conforms to AVAssetTrack.
//      func loadMetadata(for: AVMetadataFormat, completionHandler: ([AVMetadataItem]?, Error?) -> Void)
//          Loads metadata items that a track contains for the specified format.

//class Player20: UIViewController {
open class MyPlayer: NSObject, AVPlayerItemMetadataOutputPushDelegate {

    let rufm = URL(string: "https://rufm.amgradio.ru/rufm")

    private var player: AVPlayer?
    private var playerItem: AVPlayerItem?

    private func setupPlayer(with asset: AVURLAsset) {

        if player == nil {
            player = AVPlayer()
            // Removes black screen when connecting to appleTV
            player?.allowsExternalPlayback = false
        }

        playerItem = AVPlayerItem(asset: asset)
        let metadataOutput = AVPlayerItemMetadataOutput(identifiers: nil)
        metadataOutput.setDelegate(self, queue: DispatchQueue.main)
        playerItem?.add(metadataOutput)
    }

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        print("metadataOutput:", metadataOutput)
//    }
}

class Player2: UIViewController,AVPlayerItemMetadataOutputPushDelegate {

    weak var myDelegate: AVPlayerItemMetadataOutputPushDelegate?
    var playerItem: AVPlayerItem?
    var player = AVPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        print("lets go!")

        let rufm = URL(string: "https://rufm.amgradio.ru/rufm")!
        let asset = AVAsset(url: rufm)
        let playerItem = AVPlayerItem(asset: asset)

        let metadataOutput = AVPlayerItemMetadataOutput(identifiers: nil)
        metadataOutput.setDelegate(self, queue: DispatchQueue.main)
        playerItem.add(metadataOutput)

        player = AVPlayer(playerItem: playerItem)
        //    player.play()
        print("END")

        print("metadataOutput:\n", metadataOutput)
        print("playerItem.automaticallyLoadedAssetKeys.description:\n", playerItem.automaticallyLoadedAssetKeys.description)
    }

    func metadataOutput(_ output: AVPlayerItemMetadataOutput, didOutputTimedMetadataGroups groups: [AVTimedMetadataGroup], from track: AVPlayerItemTrack?) {
        print(output)
        print(groups)
        print(track ?? "-")
    }


}
