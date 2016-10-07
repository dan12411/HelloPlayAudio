//
//  ViewController.swift
//  HelloPlayAudio
//
//  Created by 洪德晟 on 2016/10/6.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import UIKit

/// 1. 拉完檔案後，匯入函式庫
import AVFoundation

class ViewController: UIViewController {
    
    /// 2. 產生AVAudioPlayer
    var myPlayer: AVAudioPlayer?

    @IBAction func myPlay(_ sender: UIButton) {
        
        /// 7. 避免連按造成的問題
        myPlayer?.stop()
        myPlayer?.currentTime = 0
        
        /// 6. 播放音樂
        myPlayer?.play()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// 3. 找到mp3的位置
        if let path = Bundle.main.path(forResource: "Right", ofType: "mp3") {
            
            /// 4. 產生URL
            let audioURL = URL(fileURLWithPath: path)
            
            /// 5. 產生AVAudio player
            do {
                myPlayer = try AVAudioPlayer(contentsOf: audioURL)
                
                /// 9. "-1"是重複播放
                myPlayer?.numberOfLoops = -1
                
                /// 10. 調整音樂大小
                myPlayer?.volume = 0.5
                
                /// 8. 調整音樂速度(可做成滑桿)
                myPlayer?.enableRate = true
                myPlayer?.rate = 2
                
            } catch {
                print("🚫 Something Wrong! 🚫")
            }
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

