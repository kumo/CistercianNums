//
//  ContentView.swift
//  Shared
//
//  Created by Robert Clarke on 03/02/21.
//

import SwiftUI

struct CistercianDrawing: OptionSet {
    let rawValue: Int
    
    static let topRightH = CistercianDrawing(rawValue: 1 << 0)
    static let topMiddleRightH = CistercianDrawing(rawValue: 1 << 1)
    static let topRightDiagDown = CistercianDrawing(rawValue: 1 << 2)
    static let topRightDiagUp = CistercianDrawing(rawValue: 1 << 3)
    static let topRightV = CistercianDrawing(rawValue: 1 << 4)
    static let topLeftH = CistercianDrawing(rawValue: 1 << 5)
    static let topMiddleLeftH = CistercianDrawing(rawValue: 1 << 6)
    static let topLeftDiagDown = CistercianDrawing(rawValue: 1 << 7)
    static let topLeftDiagUp = CistercianDrawing(rawValue: 1 << 8)
    static let topLeftV = CistercianDrawing(rawValue: 1 << 9)
    static let bottomRightH = CistercianDrawing(rawValue: 1 << 10)
    static let bottomMiddleRightH = CistercianDrawing(rawValue: 1 << 11)
    static let bottomRightDiagUp = CistercianDrawing(rawValue: 1 << 12)
    static let bottomRightDiagDown = CistercianDrawing(rawValue: 1 << 13)
    static let bottomRightV = CistercianDrawing(rawValue: 1 << 14)
    static let bottomLeftH = CistercianDrawing(rawValue: 1 << 15)
    static let bottomMiddleLeftH = CistercianDrawing(rawValue: 1 << 16)
    static let bottomLeftDiagUp = CistercianDrawing(rawValue: 1 << 17)
    static let bottomMiddleLeftDiagDown = CistercianDrawing(rawValue: 1 << 18)
    static let bottomLeftV = CistercianDrawing(rawValue: 1 << 19)
}

func convertValue(value: Int) -> CistercianDrawing {
    let data: [(Int, CistercianDrawing)] = [
        (9000, [.bottomLeftV, .bottomMiddleLeftH, .bottomLeftH]),
        (8000, [.bottomLeftV, .bottomMiddleLeftH]),
        (7000, [.bottomLeftV, .bottomLeftH]),
        (6000, [.bottomLeftV]),
        (5000, [.bottomLeftDiagUp, .bottomLeftH]),
        (4000, [.bottomLeftDiagUp]),
        (3000, [.bottomMiddleLeftDiagDown]),
        (2000, [.bottomMiddleLeftH]),
        (1000, [.bottomLeftH]),
        (900, [.bottomRightV, .bottomMiddleRightH, .bottomRightH]),
        (800, [.bottomRightV, .bottomMiddleRightH]),
        (700, [.bottomRightV, .bottomRightH]),
        (600, [.bottomRightV]),
        (500, [.bottomRightDiagUp, .bottomRightH]),
        (400, [.bottomRightDiagUp]),
        (300, [.bottomRightDiagDown]),
        (200, [.bottomMiddleRightH]),
        (100, [.bottomRightH]),
        (90, [.topLeftV, .topMiddleLeftH, .topLeftH]),
        (80, [.topLeftV, .topMiddleLeftH]),
        (70, [.topLeftV, .topLeftH]),
        (60, [.topLeftV]),
        (50, [.topLeftDiagUp, .topLeftH]),
        (40, [.topLeftDiagUp]),
        (30, [.topLeftDiagDown]),
        (20, [.topMiddleLeftH]),
        (10, [.topLeftH]),
        (9, [.topRightV, .topMiddleRightH, .topRightH]),
        (8, [.topRightV, .topMiddleRightH]),
        (7, [.topRightV, .topRightH]),
        (6, [.topRightV]),
        (5, [.topRightDiagUp, .topRightH]),
        (4, [.topRightDiagUp]),
        (3, [.topRightDiagDown]),
        (2, [.topMiddleRightH]),
        (1, [.topRightH])
    ]
    
    var convertableValue = value
    
    var result = CistercianDrawing()
    
    for (number, lines) in data {
        if number <= convertableValue {
            result.insert(lines)
            convertableValue = convertableValue - number
        }
    }
    
    return result
}

func convertValue2(value: Int) -> CistercianDrawing {
    var conversionData: [(Int, CistercianDrawing)] = [
        (9000, [.bottomLeftV, .bottomMiddleLeftH, .bottomLeftH]),
        (8000, [.bottomLeftV, .bottomMiddleLeftH]),
        (7000, [.bottomLeftV, .bottomLeftH]),
        (6000, [.bottomLeftV]),
        (5000, [.bottomMiddleLeftDiagDown, .bottomLeftH]),
        (4000, [.bottomMiddleLeftDiagDown]),
        (3000, [.bottomLeftDiagUp]),
        (2000, [.bottomMiddleLeftH]),
        (1000, [.bottomLeftH]),
    ]

    var convertMe = value
    var result = CistercianDrawing()

    for _ in 0...3 {
        for (index, data) in conversionData.enumerated() {
            if data.0 <= convertMe {
                result.insert(data.1)
                convertMe = convertMe - data.0
            }
            
            conversionData[index] = (data.0 / 10, CistercianDrawing(rawValue: data.1.rawValue >> 5))
        }
    }
    
    return result
}

struct ContentView: View {
//    var drawing: CistercianDrawing = [
//        .topRightDiagDown, .topLeftH, .topLeftV,
//        .topMiddleLeftH, .bottomLeftH, .bottomRightH,
//        .bottomRightV, .bottomMiddleRightH] // 1993
    
//    var drawing: CistercianDrawing = [
//        .topRightDiagDown, .topLeftDiagDown,
//        .bottomRightDiagDown,
//        .bottomLeftV, .bottomLeftH, .bottomMiddleLeftH] // 9433
    
    var drawing = convertValue(value: 9433)
    
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
                
                if drawing.contains(.topRightH) {
                    path.move(to: top)
                    path.addLine(to: topRight)
                }
                
                if drawing.contains(.topMiddleRightH) {
                    path.move(to: topMiddleRight)
                    path.addLine(to: topMiddle)
                }
                
                if drawing.contains(.topRightDiagDown) {
                    path.move(to: top)
                    path.addLine(to: topMiddleRight)
                }
                
                if drawing.contains(.topRightDiagUp) {
                    path.move(to: topMiddle)
                    path.addLine(to: topRight)
                }
                
                if drawing.contains(.topRightV) {
                    path.move(to: topRight)
                    path.addLine(to: topMiddleRight)
                }
                
                if drawing.contains(.topLeftH) {
                    path.move(to: top)
                    path.addLine(to: topLeft)
                }
                
                if drawing.contains(.topMiddleLeftH) {
                    path.move(to: topMiddleLeft)
                    path.addLine(to: topMiddle)
                }
                
                if drawing.contains(.topLeftDiagDown) {
                    path.move(to: top)
                    path.addLine(to: topMiddleLeft)
                }
                
                if drawing.contains(.topLeftDiagUp) {
                    path.move(to: topMiddle)
                    path.addLine(to: topLeft)
                }
                
                if drawing.contains(.topLeftV) {
                    path.move(to: topLeft)
                    path.addLine(to: topMiddleLeft)
                }
                
                if drawing.contains(.bottomLeftH) {
                    path.move(to: bottom)
                    path.addLine(to: bottomLeft)
                }
                
                if drawing.contains(.bottomMiddleLeftH) {
                    path.move(to: bottomMiddleLeft)
                    path.addLine(to: bottomMiddle)
                }
                
                if drawing.contains(.bottomLeftDiagUp) {
                    path.move(to: bottom)
                    path.addLine(to: bottomMiddleLeft)
                }
                
                if drawing.contains(.bottomMiddleLeftDiagDown) {
                    path.move(to: bottomMiddle)
                    path.addLine(to: bottomLeft)
                }
                
                if drawing.contains(.bottomLeftV) {
                    path.move(to: bottomLeft)
                    path.addLine(to: bottomMiddleLeft)
                }
                
                if drawing.contains(.bottomRightH) {
                    path.move(to: bottom)
                    path.addLine(to: bottomRight)
                }
                
                if drawing.contains(.bottomMiddleRightH) {
                    path.move(to: bottomMiddleRight)
                    path.addLine(to: bottomMiddle)
                }
                
                if drawing.contains(.bottomRightDiagUp) {
                    path.move(to: bottom)
                    path.addLine(to: bottomMiddleRight)
                }
                
                if drawing.contains(.bottomRightDiagDown) {
                    path.move(to: bottomMiddle)
                    path.addLine(to: bottomRight)
                }
                
                if drawing.contains(.bottomRightV) {
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
