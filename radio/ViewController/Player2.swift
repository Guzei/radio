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


class Player2: UIViewController {

    let metadataOutput = AVPlayerItemMetadataOutput(identifiers: nil)

    override func viewDidLoad() {
        print("metadataOutput:", metadataOutput)
    }
}
