//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let container = UIView(frame: CGRect(x: 10, y: 0, width: 600, height: 400))

container.backgroundColor = UIColor.init(red: 0.941, green: 0.965, blue: 0.992, alpha: 1)

PlaygroundPage.current.liveView = container


let view = UIView()
view.frame = CGRect(x: 150, y: 50, width: 300, height: 80)
view.backgroundColor = .white
view.layer.cornerRadius = 4

view.layer.shadowColor = UIColor.lightGray.cgColor
view.layer.shadowRadius = 2.5
view.layer.shadowOpacity = 0.2
view.layer.shadowOffset = CGSize(width: 1, height: 3)
view.layer.masksToBounds = false

container.addSubview(view)




