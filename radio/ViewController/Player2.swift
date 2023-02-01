//
//  Player2.swift
//  radio
//
//  Created by Igor Guzei on 23.01.2023.
//

// демонстрация получения метаданных

import UIKit
import MediaPlayer

class Player2: UIViewController, AVPlayerItemMetadataOutputPushDelegate {

    private var player: AVPlayer?
    private var playerItem: AVPlayerItem?
    private var metadataOutput = AVPlayerItemMetadataOutput(identifiers: nil)

    private lazy var metaInfoLabel: UILabel = {
        $0.text = "meta info"
        $0.textColor = .systemYellow
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(metaInfoLabel)
        NSLayoutConstraint.activate([
            metaInfoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            metaInfoLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])

        let radioURL = URL(string: streams[0])
        let asset = AVURLAsset(url: radioURL!)
        playerItem = AVPlayerItem(asset: asset)
        metadataOutput.setDelegate(self, queue: DispatchQueue.main)
        playerItem?.add(metadataOutput)

        player = AVPlayer(playerItem: playerItem)
        player?.play()
    }

    public func metadataOutput(_ output: AVPlayerItemMetadataOutput, didOutputTimedMetadataGroups groups: [AVTimedMetadataGroup], from track: AVPlayerItemTrack?) {
        print(groups)
        let metaInfo = groups.first?.items.first?.value as? String ?? "no metadata"
        print(metaInfo)
        metaInfoLabel.text = metaInfo
    }
}
