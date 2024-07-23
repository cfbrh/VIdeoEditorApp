//
//  TimeInterval+Ext.swift
//  VideoEditorApp
//
//  Created by 张 on 2024/7/23.
//

import Foundation


extension TimeInterval {
    var minutesSecondsMilliseconds: String {
        String(format: "%02.0f:%02.0f:%02.0f",
               (self / 60).truncatingRemainder(dividingBy: 60),
               truncatingRemainder(dividingBy: 60),
               (self * 100).truncatingRemainder(dividingBy: 100).rounded(.down))
    }
    
    
    var minuteSeconds: String {
        guard self > 0 && self < Double.infinity else {
            return "unknown"
        }
        let time = NSInteger(self)
        
        let seconds = time % 60
        let minutes = (time / 60) % 60
        
        return String(format: "%0.2d:%0.2d", minutes, seconds)
        
    }
}

