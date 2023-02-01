//
//  Player1.swift
//  radio
//
//  Created by Igor Guzei on 22.01.2023.
//

//  Simulation of switching between radio stations
//  Моделировние переключения между радиостанциями

//  AVPlayerItem
//  An object that models the timing and presentation state of an asset during playback.
//  Объект, который моделирует время и состояние представления актива во время воспроизведения.

//  A player item stores a reference to an AVAsset object, which represents the media to play. If you require inspecting an asset before you enqueue it for playback, call its load(_:) method to retrieve the values of one or more properties. Alternatively, you can tell the player item to automatically load the required properties by passing them to its init(asset:automaticallyLoadedAssetKeys:) initializer. When the player item is ready to play, the asset properties you request are ready to use.

//  Элемент проигрывателя хранит ссылку на объект AVAsset, который представляет носитель для воспроизведения. Если вам нужно проверить актив, прежде чем постановить его в очередь для воспроизведения, вызовите его метод load(_:), чтобы получить значения одного или нескольких свойств. Кроме того, вы можете указать элементу игрока автоматически загружать необходимые свойства, передав их в инициализатор init(asset:automaticallyLoadedAssetKeys:). Когда элемент игрока готов к игре, запрашиваемые вами свойства актива готовы к использованию.


import UIKit

import MediaPlayer


class Player1: UIViewController {

    //  AVPlayerItem
    let bfm   = URL(string: "https://bfm.hostingradio.ru:8004/fm32")
    let rufm  = URL(string: "https://rufm.amgradio.ru/rufm")
    let synth = URL(string: "http://195.91.220.35:8005/live192")
    let ach   = URL(string: "http://strm112.1.fm/acountry_mobile_mp3")

    var   bfmItem: AVPlayerItem!
    var  rufmItem: AVPlayerItem!
    var synthItem: AVPlayerItem!

    var player = AVPlayer()

    private lazy var svRadio: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = 16
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())

    private lazy var bBfm: UIButton = {
        $0.setImage(UIImage(systemName: "1.circle"), for: .normal)
        $0.addTarget(self, action: #selector(choiceBfm), for: .touchUpInside)
        return $0
    }(UIButton())

    private lazy var bRufm: UIButton = {
        $0.setImage(UIImage(systemName: "2.circle"), for: .normal)
        $0.addTarget(self, action: #selector(choiceRufm), for: .touchUpInside)
        return $0
    }(UIButton())

    private lazy var bSynthfm: UIButton = {
        $0.setImage(UIImage(systemName: "3.circle"), for: .normal)
        $0.addTarget(self, action: #selector(choiceSynth), for: .touchUpInside)
        return $0
    }(UIButton())

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

        svRadio.addArrangedSubview(bBfm)
        svRadio.addArrangedSubview(bRufm)
        svRadio.addArrangedSubview(bSynthfm)
        view.addSubview(svRadio)

        svController.addArrangedSubview(playButton)
        svController.addArrangedSubview(pauseButton)
        svController.addArrangedSubview(stopButton)
        view.addSubview(svController)

        NSLayoutConstraint.activate([
            svRadio.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            svRadio.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300),

            svController.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            svController.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
        ])

        bfmItem = AVPlayerItem(url: bfm!)
        rufmItem = AVPlayerItem(url: rufm!)
        synthItem = AVPlayerItem(url: synth!)
}

    @objc func choiceBfm() {
        player.replaceCurrentItem(with: bfmItem)
        player.play()
    }
    @objc func choiceRufm() {
        player.replaceCurrentItem(with: rufmItem)
        player.play()
    }
    @objc func choiceSynth() {
        player.replaceCurrentItem(with: synthItem)
        player.play()
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
