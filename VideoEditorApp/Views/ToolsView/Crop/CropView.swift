//
//  CropView.swift
//  VideoEditorApp
//
//  Created by 张 on 2024/7/23.
//

import SwiftUI

struct CropView<T: View>: View{
    @State private var position: CGPoint = .zero
    @State var size: CGSize = .zero
    @State var clipped: Bool = false
    let originalSize: CGSize
    var rotation: Double?
    var isMirror: Bool
    var setFrameScale: Bool = false
    var frameScale: CGFloat = 1
    
    @ViewBuilder
    var frameView: () -> T
    private let lineWidth: CGFloat = 2
    
    var body: some View {
        ZStack{
//            VStack {
//                Text("\(currentPosition.width)")
//                Text("\(currentPosition.height)")
//            }
            frameView()
            
            
        }
        .frame(width: originalSize.width, height: originalSize.height)
//        .clipShape(
//            CropFrame(isActive: clipped, currentPosition: position, size: size)
//        )
        //.scaleEffect(scaleEffect)
        .rotationEffect(.degrees(rotation ?? 0))
        .rotation3DEffect(.degrees(isMirror ? 180 : 0), axis: (x: 0, y: 1, z: 0))
    }
}

struct CropView_Previews: PreviewProvider {
    @State static var size: CGSize = .init(width: 250, height: 450)
    static let originalSize: CGSize = .init(width: 300, height: 600)
    static var previews: some View {
        GeometryReader { proxy in
            CropView(originalSize: originalSize, rotation: 0, isMirror: false){
                //CropImage(originalSize: originalSize, frameSize: $size){
                    
                    Rectangle()
                        .fill(Color.secondary)
                //}
                    
            }
            .allFrame()
            .frame(height: proxy.size.height / 1.45, alignment: .center)
        }
    }
}



struct CropFrame: Shape {
    let isActive: Bool
    let currentPosition: CGSize
    let size: CGSize
    func path(in rect: CGRect) -> Path {
        guard isActive else { return Path(rect) }
        
        let size = CGSize(width: size.width, height: size.height)
        let origin = CGPoint(x: rect.midX - size.width / 2, y: rect.midY - size.height / 2)
        return Path(CGRect(origin: origin, size: size).integral)
    }
}

struct CropImage<T: View>: View{
    let originalSize: CGSize
    @Binding var frameSize: CGSize
    @State private var currentPosition: CGSize = .zero
    @State private var newPosition: CGSize = .zero
    @State private var clipped = false
    
    @ViewBuilder
    var frameView: () -> T
    
    var body: some View {
        VStack {
            ZStack {
                frameView()
                    .offset(x: self.currentPosition.width, y: self.currentPosition.height)
                Rectangle()
                    .fill(Color.black.opacity(0.3))
                    .frame(width: frameSize.width , height: frameSize.height)
                    .overlay(Rectangle().stroke(Color.white, lineWidth: 2))
            }
            .clipShape(
                CropFrame(isActive: clipped, currentPosition: currentPosition, size: frameSize)
            )
            .onChange(of: frameSize) { newValue in
                currentPosition = .zero
                newPosition = .zero
            }
//            .gesture(DragGesture()
//                .onChanged { value in
//
//                    self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
//            }
//            .onEnded { value in
//                self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
//
//                self.newPosition = self.currentPosition
//            })


            Button (action : { self.clipped.toggle() }) {
                Text("Crop Image")
                    .padding(.all, 10)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .shadow(color: .gray, radius: 1)
                    .padding(.top, 50)
            }
        }
    }
}

extension Comparable{
    func bounded(lowerBound: Self, uppderBound: Self) -> Self{
        max(lowerBound, min(self, uppderBound))
    }
}
