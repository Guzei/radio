//
//  Player2.swift
//  radio
//
//  Created by Igor Guzei on 23.01.2023.
//

// MVP for demonstration output metadata

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

        let random = (0..<streams.count).randomElement()!
        print(random)
        let radioURL = URL(string: streams[random])     //  or -- streams[0] -- manual radio station selection

        let asset = AVURLAsset(url: radioURL!)
        playerItem = AVPlayerItem(asset: asset)
        metadataOutput.setDelegate(self, queue: DispatchQueue.main)
        playerItem?.add(metadataOutput)

        player = AVPlayer(playerItem: playerItem)
        player?.play()
    }

    override func viewWillDisappear(_ animated: Bool) {
        player?.replaceCurrentItem(with: nil)
    }

    public func metadataOutput(_ output: AVPlayerItemMetadataOutput, didOutputTimedMetadataGroups groups: [AVTimedMetadataGroup], from track: AVPlayerItemTrack?) {
        metaInfoLabel.text = groups.first?.items.first?.value as? String ?? "no metadata"
    }
}
