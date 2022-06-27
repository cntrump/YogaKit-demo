//
//  Demo6ViewController.swift
//  SwiftComponent
//
//  Created by lvv.me on 2022/6/27.
//

import UIKit
import YogaKitSwift

public class Demo6ViewController: UIViewController {

    public override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.yoga
               .alignItems(.center)
               .justifyContent(.center)

        let view1 = UIView()
        view.addSubview(view1)
        view1.yoga
                .flexDirection(.row)
                .flexWrap(.wrap)
                .paddings(top: -3, left: -3, bottom: 0, right: 0)
                .width(80 * 3 + 3 * 2)

        for _ in 0..<9 {
            let v = UIView()
            v.backgroundColor = .orange
            view1.addSubview(v)
            v.yoga
                .size(width: 80, height: 80)
                .margins(top: 3, left: 3, bottom: 0, right: 0)
        }
    }
}
