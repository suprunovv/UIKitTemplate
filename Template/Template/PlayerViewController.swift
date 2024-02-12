// PlayerViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFAudio
import AVFoundation
import UIKit

/// ascagwrgs wef we
class PlayerViewController: UIViewController {
    /// индекс трека ( он передается с предыдущего экрана и меняется когда листаем трек )
    var index = 0
    // MARK: - Private Properties
    @IBOutlet private var playButton: UIButton!
    @IBOutlet private var trackSlider: UISlider!
    @IBOutlet private var trackTimeElapsed: UILabel!
    @IBOutlet private var autorLabel: UILabel!
    @IBOutlet private var trackLabel: UILabel!
    @IBOutlet private var coverImageView: UIImageView!
    @IBOutlet private var volumeButton: UIButton!
    @IBOutlet private var volumeSlider: UISlider!
    /// массив моделей треков ( с названием, автором и картинкой )
    private let tracks = [
        Track(name: "Meh", autor: "Playboy carti", image: "карти"),
        Track(name: "Jus bëtter", autor: "YEAT", image: "jus"),
        Track(name: "Poland", autor: "Lil Yachty", image: "poland")
    ]
    /// переменная которая показывает включен или выключен звук
    private var isVolumeOn = true
    /// переменная показывает включен ли трек
    private var isPlay = true
    /// экземпляр плеера
    private var player = AVAudioPlayer()
    /// экземпляр таймера
    private var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Private Metods
    /// в этом методе  запускается первый трек и становится вертикально слайдер звука
    private func setup() {
        playTrack(name: tracks[index].name)
        volumeSlider.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi / 2))
        volumeSlider.setThumbImage(UIImage(named: "тумблер"), for: .normal)
        trackSlider.setThumbImage(UIImage(named: "тумблер"), for: .normal)
    }

    /// метод запускает плеер и отрисовывает название текущего трека и исполнителя
    /// а так же меняет картинку
    /// принимает название трека
    private func playTrack(name: String) {
        guard let audioPah = Bundle.main.path(forResource: name, ofType: "mp3") else {
            return
        }
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPah))
        } catch {
            print("eror")
        }
        timer = Timer.scheduledTimer(
            timeInterval: 0.1,
            target: self,
            selector: #selector(updateTime),
            userInfo: nil,
            repeats: true
        )
        trackLabel.text = tracks[index].name
        autorLabel.text = tracks[index].autor
        coverImageView.image = UIImage(named: tracks[index].image)
        player.play()
    }

    /// метод кнопки стоп - плей
    @IBAction private func playButtonAction(_ sender: UIButton) {
        if player.isPlaying {
            player.stop()
            playButton.setImage(UIImage(named: "плей"), for: .normal)
            isPlay = false
        } else {
            player.play()
            playButton.setImage(UIImage(named: "pause"), for: .normal)
            isPlay = true
        }
    }

    /// метод переключает треки вперед
    @IBAction private func goNextTrack(_ sender: UIButton) {
        player.stop()
        timer.invalidate()
        index += 1
        if index >= tracks.count {
            index = 0
        }
        playTrack(name: tracks[index].name)
        setSetings()
    }

    /// Метод переключает треки назад
    @IBAction private func goBackTrack(_ sender: UIButton) {
        player.stop()
        timer.invalidate()
        index -= 1
        if index < 0 {
            index = tracks.count - 1
        }
        playTrack(name: tracks[index].name)
        setSetings()
    }

    /// метод задает настройки при переключении треков
    /// если звук выключен то и следующем треке он будет выключен
    /// если трек на паузе то и следующий будет на паузе
    private func setSetings() {
        if isPlay {
            player.play()
        } else {
            player.stop()
        }
        if isVolumeOn {
            volumeSlider.value = 1
            player.volume = 1
        } else {
            volumeSlider.value = 0
            player.volume = 0
        }
    }

    /// метод листает трек слайдером
    @IBAction private func sliderValue(_ sender: UISlider) {
        player.currentTime = Double(sender.value)
    }

    /// метод изменяет громкость звука слайдером и меняет кнопку звука
    @IBAction private func volumeSliderAction(_ sender: UISlider) {
        player.volume = sender.value
        if sender.value == 0 {
            volumeButton.setImage(UIImage(systemName: "volume.slash.fill"), for: .normal)
        } else {
            volumeButton.setImage(UIImage(systemName: "volume.1.fill"), for: .normal)
        }
    }

    /// кнопка звука вкл/выкл
    @IBAction private func volumeButtonAction(_ sender: UIButton) {
        if isVolumeOn {
            isVolumeOn = false
            volumeButton.setImage(UIImage(systemName: "volume.slash.fill"), for: .normal)
            player.volume = 0
            volumeSlider.value = 0
        } else {
            isVolumeOn = true
            volumeButton.setImage(UIImage(systemName: "volume.1.fill"), for: .normal)
            player.volume = 1
            volumeSlider.value = 1
        }
    }

    /// метод отрисовывает время до конца трека и меняет положение слайдера
    @objc private func updateTime() {
        let time = Int(player.duration) - Int(player.currentTime) // текущее время
        let minets = time / 60 // минуты
        let second = time % 60 // в секунды
        trackTimeElapsed.text = NSString(format: "-%02d:%02d", minets, second) as String
        trackSlider.value = Float(player.currentTime)
    }

    /// выход с экрана на кнопку крестик
    @IBAction private func dismissButton(_ sender: UIButton) {
        player.stop()
        timer.invalidate()
        dismiss(animated: true, completion: nil)
    }

    /// открывает алерт при нажатии на самую нижнюю кнопку
    @IBAction private func openPlaylistAction(_ sender: UIButton) {
        let alert = UIAlertController(
            title: "Упс!",
            message: "Функционал в разработке",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(
            title: "Ok",
            style: .default,
            handler: nil
        ))
        present(alert, animated: true, completion: nil)
    }

    /// активити контроллер
    @IBAction private func shareAction(_ sender: UIButton) {
        let activity = UIActivityViewController(
            activityItems: [
                tracks[index].name,
                tracks[index].autor
            ],
            applicationActivities: nil
        )
        present(activity, animated: true, completion: nil)
    }
}
