//
//  ContentView.swift
//  Shared
//
//  Created by Robert Clarke on 03/02/21.
//

import SwiftUI

class CistercianNumeralData: ObservableObject {
    @Published var drawing: CistercianDrawing = CistercianDrawing()
    @Published var input = "0" {
        didSet {
            if let convertedValue = convertValue2(value: input) {
                drawing = convertedValue
            }
        }
    }
}

struct CistercianNumeralView: View {
    
    var drawing: CistercianDrawing = CistercianDrawing()
    
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
        
    }}

struct ContentView: View {
    
    @StateObject var data = CistercianNumeralData()

    var body: some View {
        VStack {
            CistercianNumeralView(drawing: data.drawing)
            
            Divider()
            
            HStack {
                Spacer()
                Text(data.input)
                    .font(.largeTitle)
            }.padding([.leading, .trailing])
            
            Divider()
            
            KeyPad(string: $data.input)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
