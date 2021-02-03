//
//  ContentView.swift
//  Shared
//
//  Created by Robert Clarke on 03/02/21.
//

import SwiftUI

struct CistercianDrawing: OptionSet {
    let rawValue: Int
    
    static let line1 = CistercianDrawing(rawValue: 1 << 0)
    static let line2 = CistercianDrawing(rawValue: 1 << 1)
    static let line3 = CistercianDrawing(rawValue: 1 << 2)
    static let line4 = CistercianDrawing(rawValue: 1 << 3)
    static let line5 = CistercianDrawing(rawValue: 1 << 4)
    static let line11 = CistercianDrawing(rawValue: 1 << 5)
    static let line12 = CistercianDrawing(rawValue: 1 << 6)
    static let line13 = CistercianDrawing(rawValue: 1 << 7)
    static let line14 = CistercianDrawing(rawValue: 1 << 8)
    static let line15 = CistercianDrawing(rawValue: 1 << 9)
    static let line21 = CistercianDrawing(rawValue: 1 << 10)
    static let line22 = CistercianDrawing(rawValue: 1 << 11)
    static let line23 = CistercianDrawing(rawValue: 1 << 12)
    static let line24 = CistercianDrawing(rawValue: 1 << 13)
    static let line25 = CistercianDrawing(rawValue: 1 << 14)
    static let line31 = CistercianDrawing(rawValue: 1 << 15)
    static let line32 = CistercianDrawing(rawValue: 1 << 16)
    static let line33 = CistercianDrawing(rawValue: 1 << 17)
    static let line34 = CistercianDrawing(rawValue: 1 << 18)
    static let line35 = CistercianDrawing(rawValue: 1 << 19)
}

struct ContentView: View {
    var number = 9
    
    var drawing: CistercianDrawing = [
        .line3, .line11, .line15,
        .line12, .line21, .line31,
        .line35, .line32]
    
    var body: some View {
        GeometryReader { geometry in
            
            Path { path in
                let width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                
                let top = CGPoint(
                    x: width * 0.5,
                    y: height * 0.0
                )
                
                let bottom = CGPoint(
                    x: width * 0.5,
                    y: height * 1.0
                )
                
                let topRight = CGPoint(
                    x: width * 0.75,
                    y: height * 0.0
                )
                
                let topMiddleRight = CGPoint(
                    x: width * 0.75,
                    y: height * 0.25
                )
                
                let topMiddle = CGPoint(
                    x: width * 0.5,
                    y: height * 0.25
                )
                
                let topLeft = CGPoint(
                    x: width * 0.25,
                    y: height * 0.0
                )
                
                let topMiddleLeft = CGPoint(
                    x: width * 0.25,
                    y: height * 0.25
                )
                
                let bottomLeft = CGPoint(
                    x: width * 0.25,
                    y: height * 1.0
                )
                
                let bottomMiddleLeft = CGPoint(
                    x: width * 0.25,
                    y: height * 0.75
                )
                
                let bottomMiddle = CGPoint(
                    x: width * 0.5,
                    y: height * 0.75
                )
                
                let bottomRight = CGPoint(
                    x: width * 0.75,
                    y: height * 1.0
                )
                
                let bottomMiddleRight = CGPoint(
                    x: width * 0.75,
                    y: height * 0.75
                )
                
                path.move(to: top)
                path.addLine(to: bottom)
                
                if drawing.contains(.line1) {
                    path.move(to: top)
                    path.addLine(to: topRight)
                }
                
                if drawing.contains(.line2) {
                    path.move(to: topMiddleRight)
                    path.addLine(to: topMiddle)
                }
                
                if drawing.contains(.line3) {
                    path.move(to: top)
                    path.addLine(to: topMiddleRight)
                }
                
                if drawing.contains(.line4) {
                    path.move(to: topMiddle)
                    path.addLine(to: topRight)
                }
                
                if drawing.contains(.line5) {
                    path.move(to: topRight)
                    path.addLine(to: topMiddleRight)
                }
                
                if drawing.contains(.line11) {
                    path.move(to: top)
                    path.addLine(to: topLeft)
                }
                
                if drawing.contains(.line12) {
                    path.move(to: topMiddleLeft)
                    path.addLine(to: topMiddle)
                }
                
                if drawing.contains(.line13) {
                    path.move(to: top)
                    path.addLine(to: topMiddleLeft)
                }
                
                if drawing.contains(.line14) {
                    path.move(to: topMiddle)
                    path.addLine(to: topLeft)
                }
                
                if drawing.contains(.line15) {
                    path.move(to: topLeft)
                    path.addLine(to: topMiddleLeft)
                }
                
                if drawing.contains(.line21) {
                    path.move(to: bottom)
                    path.addLine(to: bottomLeft)
                }
                
                if drawing.contains(.line22) {
                    path.move(to: bottomMiddleLeft)
                    path.addLine(to: bottomMiddle)
                }
                
                if drawing.contains(.line23) {
                    path.move(to: bottom)
                    path.addLine(to: bottomMiddleLeft)
                }
                
                if drawing.contains(.line24) {
                    path.move(to: bottomMiddle)
                    path.addLine(to: bottomLeft)
                }
                
                if drawing.contains(.line25) {
                    path.move(to: bottomLeft)
                    path.addLine(to: bottomMiddleLeft)
                }
                
                if drawing.contains(.line31) {
                    path.move(to: bottom)
                    path.addLine(to: bottomRight)
                }
                
                if drawing.contains(.line32) {
                    path.move(to: bottomMiddleRight)
                    path.addLine(to: bottomMiddle)
                }
                
                if drawing.contains(.line33) {
                    path.move(to: bottom)
                    path.addLine(to: bottomMiddleRight)
                }
                
                if drawing.contains(.line34) {
                    path.move(to: bottomMiddle)
                    path.addLine(to: bottomRight)
                }
                
                if drawing.contains(.line35) {
                    path.move(to: bottomRight)
                    path.addLine(to: bottomMiddleRight)
                }
            }
            .stroke(Color.green, style: StrokeStyle(lineWidth: 4.0, lineCap: .round))
        }
        .aspectRatio(1, contentMode: .fit)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
