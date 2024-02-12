// PlaylistViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// конроллер плейлиста
class PlaylistViewController: UIViewController {
    /// передает индекс на следующий экран
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let secondVc = segue.destination as? PlayerViewController else { return
        }
        switch segue.identifier {
        case "trackOne":
            secondVc.index = 0
        case "trackTwo":
            secondVc.index = 1
        case "trackThre":
            secondVc.index = 2
        default: break
        }
    }
}
