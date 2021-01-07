//
//  Pie.swift
//  SwiftUI_Day3
//
//  Created by 陈金雷 on 2021/1/7.
//

import SwiftUI

struct Pie:Shape{
    var  startAngle:Angle
    var endAngel:Angle
    var clockwise:Bool = false
    
    var animatableData:AnimatablePair<Double,Double>{
        get{
            AnimatablePair(startAngle.radians,endAngel.radians)
        }
        set{
            startAngle = Angle.radians(newValue.first)
            endAngel = Angle.radians(newValue.second)
        }
    }
    
    func path(in rect :CGRect)->Path{
        let center = CGPoint(x:rect.midX,y:rect.midY)
        let radius = min(rect.width,rect.height)/2
        let start = CGPoint(x:center.x + radius * cos(CGFloat(startAngle.radians)),
                            y:center.y + radius * sin(CGFloat(startAngle.radians))
        )
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(center: center,
                 radius: radius,
                 startAngle: startAngle,
                 endAngle: endAngel,
                 clockwise: clockwise
        )
        p.addLine(to: center)
        return p
    }
}
