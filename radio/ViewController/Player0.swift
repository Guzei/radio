//
//  Player0.swift
//  radio
//
//  Created by Igor Guzei on 19.01.2023
//
//  Minimum code for one radio playing with simple controls
//  Минимальный код для востпроизведения одной радиостанции с простейшим контроллером
//
//  Creates a new player to play a single audiovisual resource referenced by a given URL.
//  This method implicitly creates an AVPlayerItem object. You can get the player item using currentItem.
//  https://developer.apple.com/documentation/avfoundation/avplayer/1385706-init
//


import UIKit
import MediaPlayer          // AVPlayer()  // An object that provides the interface to control the player’s transport behavior.

class Player0: UIViewController {

    var player = AVPlayer(url: URL(string: "https://rufm.amgradio.ru/rufm")!)

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

    private lazy var pauseButton: UIButton = {
        $0.setImage(UIImage(systemName: "pause.circle"), for: .normal)
        $0.addTarget(self, action: #selector(pressPauseButton), for: .touchUpInside)
        return $0
    }(UIButton())

    private lazy var stopButton: UIButton = {
        $0.setImage(UIImage(systemName: "stop.circle"), for: .normal)
        $0.addTarget(self, action: #selector(pressStopButton), for: .touchUpInside)
        return $0
    }(UIButton())

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

        print("player.currentItem:", player.currentItem ?? "-")
        print("player.status:", player.status)
        print("player.rate:", player.rate)
        print("player.defaultRate:", player.defaultRate)
        print("player.automaticallyWaitsToMinimizeStalling:", player.automaticallyWaitsToMinimizeStalling)
    }

    @objc func pressPlayButton() {
        player.play()
    }
    @objc func pressPauseButton() {
        player.pause()
    }
    @objc func pressStopButton() {
        player.replaceCurrentItem(with: nil)
    }
}
