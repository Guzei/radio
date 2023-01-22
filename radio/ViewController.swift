//
//  ViewController.swift
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


class ViewController: UIViewController {

    let bfm  = URL(string: "https://bfm.hostingradio.ru:8004/fm32")
    let alfa = URL(string: "https://radioalfa1111.blogspot.com")
    let folkObondoru = URL(string: "https://player.europa.kg:1105/stream")

    var player = AVPlayer()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        player = AVPlayer(playerItem: AVPlayerItem(url: folkObondoru!))
        player.play()
    }
}
