//
//  ViewController.swift
//  AudioEffect-NO.1-2
//
//  Created by Bruce on 16/6/7.
//  Copyright © 2016年 Bruce. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //    创建音频引擎
    lazy var engine = AVAudioEngine()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //        获得输入端口
        let input = engine.inputNode!
        //        连接输入输出设置格式
        engine.connect(input, to: engine.outputNode, format: input.inputFormatForBus(0))
        //       用于创建record/monitor/observe的输出端口
        input.installTapOnBus(0, bufferSize: 8192, format: input.inputFormatForBus(0)) { (AVAudioPCMBuffer, AVAudioTime) in
            print("XXXXX")
            print(AVAudioPCMBuffer,AVAudioTime)
        }
        //       开启引擎
        try! engine.start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

