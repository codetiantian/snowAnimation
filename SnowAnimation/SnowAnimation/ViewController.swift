//
//  ViewController.swift
//  SnowAnimation
//
//  Created by 这个夏天有点冷 on 2017/4/19.
//  Copyright © 2017年 YLT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        snow()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController {
    fileprivate func snow() {
        //  通过CAEmitterLayer可以很原生的创造微粒效果
        let emitter = CAEmitterLayer.init()
        let rect = CGRect.init(x: 0.0, y: -100.0, width: view.bounds.width, height: view.bounds.height + 100)
        emitter.backgroundColor = UIColor.black.cgColor
        emitter.frame = rect
        view.layer.addSublayer(emitter)
        
        // kCAEmitterLayerPoint 将所有的粒子集中在position的位置,可用来做火花爆炸效果
        // kCAEmitterLayerLine 所有的粒子位于一条线上,可用来作瀑布效果
        // kCAEmitterLayerRectangle 所有粒子随机出现在所给定的矩形框内
        emitter.emitterShape = kCAEmitterLayerLine
        emitter.emitterPosition = CGPoint.init(x: rect.width / 2, y: 0)
        emitter.emitterSize = rect.size
        
        //  一个cell代表一个微粒
        let emitterCell = CAEmitterCell.init()
        emitterCell.contents = UIImage.init(named: "flake3")!.cgImage
        
        //  每秒创建的cell
        emitterCell.birthRate = 250
        // cell的生命周期为1.5秒
        // emitter可以添加很多不同类型的cell
        emitter.emitterCells = [emitterCell]
        
        //  制造一个y轴的加速度
        emitterCell.yAcceleration = 70.0
        //  制造一个x轴的加速度
        emitterCell.xAcceleration = 10.0
        
        //  给微粒设置一个发射角度
        emitterCell.emissionLongitude = CGFloat(-Double.pi)
        
        //  添加随机的速度,如果有velocity,那么范围为 -180 ~ 220
        emitterCell.velocityRange = 200.0
        emitterCell.emissionRange = CGFloat(Double.pi / 2)
        
        emitterCell.lifetimeRange = 18
        
        
        //  emitterCell.color = UIColor(red: 0.9, green: 1.0, blue: 1.0, alpha: 1.0).CGColor
        //  值为0.3 的范围为 0.7~1.3,但由于高于1算1,所以值得范围为 0.7~1
        emitterCell.redRange = 0.3
        emitterCell.greenRange = 0.3
        emitterCell.blueRange = 0.3
        
        //  随机大小
        emitterCell.scaleRange = 0.8
        
        //  每秒缩小15%
        emitterCell.scaleSpeed = -0.05
        
        emitterCell.alphaRange = 0.75
        emitterCell.alphaSpeed = -0.15
    }
}
