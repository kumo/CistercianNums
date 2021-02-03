//
//  ContentView.swift
//  Shared
//
//  Created by Robert Clarke on 03/02/21.
//

import SwiftUI

struct ContentView: View {
    var number = 9
    
    var body: some View {
        GeometryReader { geometry in
            
            Path { path in
                let width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                
                path.move(
                    to: CGPoint(
                        x: width * 0.5,
                        y: height * 0.0
                    )
                )
                path.addLine(to: CGPoint(x: width * 0.5, y: height * 1.0))
                
                if number == 1 {
                    path.move(
                        to: CGPoint(
                            x: width * 0.5,
                            y: height * 0.0
                        )
                    )
                    path.addLine(to: CGPoint(x: width * 0.6, y: height * 0.0))
                }
                
                if number == 2 {
                    path.move(
                        to: CGPoint(
                            x: width * 0.5,
                            y: height * 0.1
                        )
                    )
                    path.addLine(to: CGPoint(x: width * 0.6, y: height * 0.1))
                }
                
                if number == 3 {
                    path.move(
                        to: CGPoint(
                            x: width * 0.5,
                            y: height * 0.0
                        )
                    )
                    path.addLine(to: CGPoint(x: width * 0.6, y: height * 0.1))
                }
                
                if number == 4 {
                    path.move(
                        to: CGPoint(
                            x: width * 0.5,
                            y: height * 0.1
                        )
                    )
                    path.addLine(to: CGPoint(x: width * 0.6, y: height * 0.0))
                }
                
                if number == 5 {
                    path.move(
                        to: CGPoint(
                            x: width * 0.5,
                            y: height * 0.25
                        )
                    )
                    path.addLine(to: CGPoint(x: width * 0.75, y: height * 0.0))
                    path.addLine(to: CGPoint(x: width * 0.5, y: height * 0.0))
                }
                
                if number == 6 {
                    path.move(
                        to: CGPoint(
                            x: width * 0.75,
                            y: height * 0.25
                        )
                    )
                    path.addLine(to: CGPoint(x: width * 0.75, y: height * 0.0))
                }
                
                if number == 7 {
                    path.move(
                        to: CGPoint(
                            x: width * 0.75,
                            y: height * 0.25
                        )
                    )
                    path.addLine(to: CGPoint(x: width * 0.75, y: height * 0.0))
                    path.addLine(to: CGPoint(x: width * 0.5, y: height * 0.0))
                }
                
                if number == 8 {
                    path.move(
                        to: CGPoint(
                            x: width * 0.75,
                            y: height * 0.0
                        )
                    )
                    path.addLine(to: CGPoint(x: width * 0.75, y: height * 0.25))
                    path.addLine(to: CGPoint(x: width * 0.5, y: height * 0.25))
                }
                
                if number == 9 {
                    path.move(
                        to: CGPoint(
                            x: width * 0.5,
                            y: height * 0.0
                        )
                    )
                    path.addLine(to: CGPoint(x: width * 0.75, y: height * 0.0))
                    path.addLine(to: CGPoint(x: width * 0.75, y: height * 0.25))
                    path.addLine(to: CGPoint(x: width * 0.5, y: height * 0.25))
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
