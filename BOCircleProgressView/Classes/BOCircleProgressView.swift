//
//  BOCircleProgressView.swift
//  Byteout
//
//  Created by Jelena on 10/24/18.
//  Copyright © 2018 Byteout. All rights reserved.
//

import UIKit

public class BOCircleProgressView: UIView {
    
    // MARK: - Properties
    private var radius: CGFloat = 0
    private var progressLayer: CAShapeLayer?
    private var progressLabel: UILabel = UILabel.init()
    
    public var progressLabelFont: UIFont = UIFont.systemFont(ofSize: 11.0) {
        didSet {
            progressLabel.font = progressLabelFont
        }
    }
    
    @IBInspectable public var width: CGFloat = 20 {
        didSet {
            configureView()
        }
    }
    
    @IBInspectable public var barColor: UIColor = UIColor.lightGray {
        didSet {
            drawLayer(angle: 2 * CGFloat.pi, color: barColor)
            progressLayer = drawLayer(angle: 0, color: progressColor)
        }
    }
    
    @IBInspectable public var progressColor: UIColor = UIColor.black {
        didSet {
            drawLayer(angle: 2 * CGFloat.pi, color: barColor)
            progressLayer = drawLayer(angle: 0, color: progressColor)
        }
    }
    
    @IBInspectable public var progressLabelColor: UIColor = UIColor.black {
        didSet {
            progressLabel.textColor = progressLabelColor
        }
    }
    
    @IBInspectable public var invalidPercentageText: String = "N/A"
    
    // MARK: - Constants
    
    /// Progress ring starts filling up from the top.
    private let startAngle = -CGFloat.pi * 0.5
    
    // MARK: - Init
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    // MARK: - Helpers
    private func configureView() {
        let halfWidth = floor(frame.size.width / 2.0)
        let halfHeight = floor(frame.size.height / 2.0)
        radius = min(halfWidth, halfHeight)
        
        layer.cornerRadius = radius;
        clipsToBounds = true
        backgroundColor = .clear
        
        addLabel(halfWidth, halfHeight)
        
        drawLayer(angle: 2 * CGFloat.pi, color: barColor)
        progressLayer = drawLayer(angle: 0, color: progressColor)
    }
    
    private func addLabel(_ centerX: CGFloat, _ centerY: CGFloat) {
        progressLabel.frame = CGRect.init(x: 0, y: 0, width: frame.size.width - 2 * width, height: frame.size.height - 2 * width)
        progressLabel.center = CGPoint.init(x: centerX, y: centerX)
        progressLabel.textColor = progressLabelColor
        progressLabel.textAlignment = .center
        progressLabel.text = "0%"
        progressLabel.font = progressLabelFont
        
        if !subviews.contains(progressLabel) {
            addSubview(progressLabel)
        }
    }
    
    @discardableResult
    private func drawLayer(angle: CGFloat, color: UIColor) -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = drawPath(angle: angle)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = width * 0.5
        layer.addSublayer(shapeLayer)
        
        return shapeLayer
    }
    
    private func drawPath(angle: CGFloat) -> CGPath {
        return UIBezierPath(arcCenter: CGPoint(x: radius,y: radius), radius: (radius - width * 0.25), startAngle: CGFloat(startAngle), endAngle:startAngle + angle, clockwise: true).cgPath
    }

    /**
     Displays progress in a circle based on a given value (paints the progress ring up to the specified percentage).
     
     - Parameter progress: Value must be between 0 and 1. For negative percentage values, `invalidPercentageText` will be displayed. That text defaults to N/A, but it can be changed.

     */
    public func updateProgress(progress: CGFloat) {
        let myProgress = progress >= 0 ? progress : 0
    
        progressLayer?.path = drawPath(angle: myProgress * 2 * CGFloat.pi)
        progressLayer?.setNeedsLayout()
        
        let percentage = Int(myProgress * 100)
        
        progressLabel.text = progress >= 0 ? "\(percentage)%" : invalidPercentageText
    }
}
