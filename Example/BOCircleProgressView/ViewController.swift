//
//  ViewController.swift
//  BOCircleProgressView
//
//  Created by Jelena on 09/09/2020.
//  Copyright (c) 2020 Jelena. All rights reserved.
//

import UIKit
import BOCircleProgressView

class ViewController: UIViewController {
    
    @IBOutlet weak var progressView: BOCircleProgressView! // 1. Added from Storyboard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. Added from Storyboard
        progressView.updateProgress(progress: 0.6)
        progressView.progressLabelFont = UIFont.systemFont(ofSize: 40)
        
        // 2. Added from code
        let progressView2 = BOCircleProgressView.init(frame: CGRect.init(x: 20, y: 20, width: 100, height: 100))
        view.addSubview(progressView2)
        progressView2.progressColor = UIColor.blue
        progressView2.updateProgress(progress: 0.32)
        
        // 3. Added from code, changed everything from code, invalid percentage value
        let progressView3 = BOCircleProgressView.init(frame: CGRect.init(x: 150, y: 20, width: 100, height: 100))
        view.addSubview(progressView3)
        progressView3.barColor = #colorLiteral(red: 0.9764705896, green: 0.9444074798, blue: 0.8672556217, alpha: 1)
        progressView3.progressColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        progressView3.progressLabelColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        progressView3.progressLabelFont = UIFont.systemFont(ofSize: 14)
        progressView3.invalidPercentageText = "Error"
        progressView3.width = 30
        progressView3.updateProgress(progress: -1)
    }
}

