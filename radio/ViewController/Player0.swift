//
//  Player0.swift
//  radio
//
//  Created by Igor Guzei on 19.01.2023.
//
// v.0.2 2023-01-22

import UIKit
//import AVFAudio
//import Foundation
import MediaPlayer          // AVPlayer()
//import AVKit
//import Kingfisher


class Player0: UIViewController {

    // An object that provides the interface to control the player’s transport behavior.
    // https://developer.apple.com/documentation/avfoundation/avplayer
    var player = AVPlayer()

    private lazy var svController: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = 16
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())

    private lazy var playButton: UIButton = {
        $0.setImage(UIImage(systemName: "play.circle"), for: .normal)
        $0.addTarget(self, action: #selector(pressPlayButton), for: .touchUpInside)
        return $0
    }(UIButton())
    @objc func pressPlayButton() {
        player.play()
    }

    private lazy var pauseButton: UIButton = {
        $0.setImage(UIImage(systemName: "pause.circle"), for: .normal)
        $0.addTarget(self, action: #selector(pressPauseButton), for: .touchUpInside)
        return $0
    }(UIButton())
    @objc func pressPauseButton() {
        player.pause()
    }

    private lazy var stopButton: UIButton = {
        $0.setImage(UIImage(systemName: "stop.circle"), for: .normal)
        $0.addTarget(self, action: #selector(pressStopButton), for: .touchUpInside)
        return $0
    }(UIButton())
    @objc func pressStopButton() {
        player.replaceCurrentItem(with: nil)
    }

    let bfm  = URL(string: "https://bfm.hostingradio.ru:8004/fm32")
    let alfa = URL(string: "https://radioalfa1111.blogspot.com")
    let folkObondoru = URL(string: "https://player.europa.kg:1105/stream")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        svController.addArrangedSubview(playButton)
        svController.addArrangedSubview(pauseButton)
        svController.addArrangedSubview(stopButton)
        view.addSubview(svController)

        NSLayoutConstraint.activate([
            svController.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            svController.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])

        player = AVPlayer(playerItem: AVPlayerItem(url: folkObondoru!))
    }
}
