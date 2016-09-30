//
//  UIButton+Configurable.swift
//  GridKit
//
//  Created by Dmitry Ivanenko on 19.09.16.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import UIKit


extension UIButton: Configurable {
  
  public func configure(with title: String) {
    setTitle(title, for: .normal)
  }
  
}
