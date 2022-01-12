//
//  ViewController.swift
//  Animation
//
//  Created by Artem Zhuzhgin on 11.01.2022.
//

//import UIKit
import Spring

class ViewController: UIViewController {

    @IBOutlet weak var coreAnimation: UIView!
    @IBOutlet weak var springAnimationView: SpringView!
    @IBOutlet weak var springInfoLabel: UILabel!
    
    let anime = Anime()
    var index = 0

    @IBAction func runSpringAnimation(_ sender: SpringButton) {
        let delay = Double.random(in: 0 ... 0.3)
        let duration = Double.random(in: 1 ... 2)
        let curveNumber = Int.random(in: 0 ... (anime.curve.count - 1))
        
        springAnimationView.animation = anime.preset[index]
        springAnimationView.curve = anime.curve[curveNumber]
        springAnimationView.duration = CGFloat(duration)
        springAnimationView.delay = CGFloat(delay)
        springInfoLabel.text = """
            animation: \(anime.preset[index])
            curve: \(anime.curve[curveNumber])
            duration: \(duration)
            delay: \(delay)
            """
        springAnimationView.animate()
        
        if index < (anime.preset.count - 1) {
            index += 1
        } else {index = 0}
        
        sender.setTitle(anime.preset[index], for: .normal)
    }
        
}
    


