//
//  ToolModel.swift
//  VideoEditorApp
//
//  Created by 张 on 2024/7/23.
//

import Foundation


enum ToolEnum: Int, CaseIterable{
    case cut, audio, text, frames
    
    
    var title: String{
        switch self {
        case .cut: return "Cut"
        case .audio: return "Audio"
        case .text: return "Text"
        case .frames: return "Frames"
        }
    }
    
    var image: String{
        switch self {
        case .cut: return "scissors"
        case .audio: return "waveform"
        case .text: return "t.square.fill"
        case .frames: return "person.crop.artframe"
        }
    }
    
    var timeState: TimeLineViewState{
        switch self{
        case .audio: return .audio
        case .text: return .text
        default: return .empty
        }
    }
}
    


