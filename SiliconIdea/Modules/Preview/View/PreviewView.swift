//
//  PreviewView.swift
//  SiliconIdea
//
//  Created by Егорио on 28.03.2025.
//

import UIKit
import Lottie

class PreviewView: UIViewController {
    
    var viewModel: PreviewViewModel?
    
    init(viewModel: PreviewViewModel? = nil) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy private var lottieView: LottieAnimationView = {
        $0.frame.size = CGSize(width: view.frame.width - 80, height: view.frame.width - 80)
        $0.center = view.center
        $0.loopMode = .loop
        return $0
    }(LottieAnimationView(name: "PreviewAnimation"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = LightThemeColors.backgroundColor
        self.view.addSubview(lottieView)
        lottieView.play()
        
        viewModel?.navigateNextScreen()
    }
}
