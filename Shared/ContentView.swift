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
                
                let point1 = CGPoint(
                    x: width * 0.75,
                    y: height * 0.0
                )
                
                let point2 = CGPoint(
                    x: width * 0.75,
                    y: height * 0.25
                )
                
                let point3 = CGPoint(
                    x: width * 0.5,
                    y: height * 0.25
                )
                
                let point4 = CGPoint(
                    x: width * 0.75,
                    y: height * 0.0
                )

                let point11 = CGPoint(
                    x: width * 0.25,
                    y: height * 0.0
                )
                
                let point12 = CGPoint(
                    x: width * 0.25,
                    y: height * 0.25
                )
                
                let point14 = CGPoint(
                    x: width * 0.25,
                    y: height * 0.0
                )

                let point21 = CGPoint(
                    x: width * 0.25,
                    y: height * 1.0
                )
                
                let point22 = CGPoint(
                    x: width * 0.25,
                    y: height * 0.75
                )
                
                let point23 = CGPoint(
                    x: width * 0.5,
                    y: height * 0.75
                )
                
                let point24 = CGPoint(
                    x: width * 0.25,
                    y: height * 1.0
                )
                
                let point31 = CGPoint(
                    x: width * 0.75,
                    y: height * 1.0
                )
                
                let point32 = CGPoint(
                    x: width * 0.75,
                    y: height * 0.75
                )
                
                let point34 = CGPoint(
                    x: width * 0.75,
                    y: height * 1.0
                )

                path.move(to: top)
                path.addLine(to: bottom)
                
                if drawing.contains(.line1) {
                    path.move(to: top)
                    path.addLine(to: point1)
                }
                
                if drawing.contains(.line2) {
                    path.move(to: point2)
                    path.addLine(to: point3)
                }
                
                if drawing.contains(.line3) {
                    path.move(to: top)
                    path.addLine(to: point2)
                }
                
                if drawing.contains(.line4) {
                    path.move(to: point3)
                    path.addLine(to: point4)
                }
                
                if drawing.contains(.line5) {
                    path.move(to: point1)
                    path.addLine(to: point2)
                }
                
                if drawing.contains(.line11) {
                    path.move(to: top)
                    path.addLine(to: point11)
                }
                
                if drawing.contains(.line12) {
                    path.move(to: point12)
                    path.addLine(to: point3)
                }
                
                if drawing.contains(.line13) {
                    path.move(to: top)
                    path.addLine(to: point12)
                }
                
                if drawing.contains(.line14) {
                    path.move(to: point3)
                    path.addLine(to: point14)
                }
                
                if drawing.contains(.line15) {
                    path.move(to: point11)
                    path.addLine(to: point12)
                }
                
                if drawing.contains(.line21) {
                    path.move(to: bottom)
                    path.addLine(to: point21)
                }
                
                if drawing.contains(.line22) {
                    path.move(to: point22)
                    path.addLine(to: point23)
                }
                
                if drawing.contains(.line23) {
                    path.move(to: bottom)
                    path.addLine(to: point22)
                }
                
                if drawing.contains(.line24) {
                    path.move(to: point23)
                    path.addLine(to: point24)
                }
                
                if drawing.contains(.line25) {
                    path.move(to: point21)
                    path.addLine(to: point22)
                }
                
                if drawing.contains(.line31) {
                    path.move(to: bottom)
                    path.addLine(to: point31)
                }
                
                if drawing.contains(.line32) {
                    path.move(to: point32)
                    path.addLine(to: point23)
                }
                
                if drawing.contains(.line33) {
                    path.move(to: bottom)
                    path.addLine(to: point32)
                }
                
                if drawing.contains(.line34) {
                    path.move(to: point23)
                    path.addLine(to: point34)
                }
                
                if drawing.contains(.line35) {
                    path.move(to: point31)
                    path.addLine(to: point32)
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
