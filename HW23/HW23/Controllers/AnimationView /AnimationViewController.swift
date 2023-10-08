//
//  AnimationViewController.swift
//  HW23
//
//  Created by Roman Litvinovich on 05/10/2023.
//

import UIKit
import Lottie

final class AnimationViewController: UIViewController {
    
    @IBOutlet private weak var coreAnimationView: UIView!
    
    @IBOutlet private weak var stackView: UIStackView!
    
    @IBOutlet private weak var lottieAnimationButton: UIButton!
    @IBOutlet private weak var coreAnimationButton: UIButton!
    
    private var lottieAnimationView: LottieAnimationView!
    private var active = true


    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        //setupLottieAnimationView()
    }
    
    // MARK: - configure UI
    private func setupUI() {
        coreAnimationView.roundElement()
        coreAnimationButton.roundElementIntHeight()
        lottieAnimationButton.roundElementIntHeight()
        
    }
    
    @IBAction func coreAnimationButtonAction(_ sender: UIButton) {
        setupCoreAnimation()
        sender.pulsate()
    }
    
    @IBAction func lottieAnimationBtn(_ sender: Any) {
        if active {
            setupLottieAnimationView()
            lottieAnimationView.play()
        } else {
            lottieAnimationView.stop()
            lottieAnimationView.removeFromSuperview()
        }
        active.toggle()
    }
    
    
    
    private func setupCoreAnimation() {
        coreAnimationView.frame.origin.x = 0
        
        UIView.animate(withDuration: 1, delay: 0, options: [.autoreverse, .repeat]) {
            [weak self] in self?.coreAnimationView.frame.origin.x += 40
        }
    }
    
    private func setupLottieAnimationView() {
        let animationsArray = ["bell",
                               "block-mic",
                               "check-circle",
                               "phonelink-reng",
                               "settings"]
        
        lottieAnimationView = .init(name: animationsArray[Int.random(in: 0 ... animationsArray.count - 1)])
        
        lottieAnimationView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        lottieAnimationView.contentMode = .scaleAspectFit
        lottieAnimationView.loopMode = .autoReverse
        lottieAnimationView.animationSpeed = 0.5
        stackView.addArrangedSubview(lottieAnimationView)
    }

}
