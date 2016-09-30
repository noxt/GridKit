//
//  UILabel+Configurable.swift
//  GridKit
//
//  Created by Dmitry Ivanenko on 19.09.16.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import UIKit


extension UILabel: Configurable {
  
  public func configure(with text: String) {
    self.text = text
  }
  
}
