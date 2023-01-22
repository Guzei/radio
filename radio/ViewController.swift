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

    let bfm = URL(string: "https://bfm.hostingradio.ru:8004/fm32")
    var player = AVPlayer()

//    private lazy var player: AVAudioPlayer = {
//        do {
//            let player = try AVAudioPlayer(contentsOf: bfm!)
//            return player
//        }
//        catch {
//            print("Error")
//        }
//        return player
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let playerItem = AVPlayerItem(url: bfm!)
        player = AVPlayer(playerItem: playerItem)
        player.play()
    }
}
