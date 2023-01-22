//
//  Player0.swift
//  radio
//
//  Created by Igor Guzei on 19.01.2023.
//

import UIKit
//import AVFAudio
//import Foundation
import MediaPlayer          // AVPlayer()
//import AVKit
//import Kingfisher


class Player0: UIViewController {

    let bfm  = URL(string: "https://bfm.hostingradio.ru:8004/fm32")
    let alfa = URL(string: "https://radioalfa1111.blogspot.com")
    let folkObondoru = URL(string: "https://player.europa.kg:1105/stream")

    var player = AVPlayer()

    private lazy var pauseButton: UIButton = {
        $0.setTitle("Pause", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 4
        $0.layer.shadowOffset = CGSize(width: 4, height: 4)
        $0.layer.shadowRadius = 4
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.7
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.widthAnchor.constraint(equalToConstant: 200).isActive = true
        $0.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        return $0
    }(UIButton())

    @objc func pressButton() {
        player.pause()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(pauseButton)


        NSLayoutConstraint.activate([
            pauseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pauseButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])

        player = AVPlayer(playerItem: AVPlayerItem(url: folkObondoru!))
        player.play()
    }
}
