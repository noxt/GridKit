//
//  ViewAction.swift
//  GridKit
//
//  Created by Dmitry Ivanenko on 19.09.16.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import UIKit


struct GridKitNotifications {
  static let ViewAction = "GridKitViewAction"
}


public class ViewAction {
  
  public let view: UIView
  public let key: String
  public let userInfo: [AnyHashable: Any]?
  
  public init(key: String, sender: UIView, userInfo: [AnyHashable: Any]? = nil) {
    self.key = key
    self.view = sender
    self.userInfo = userInfo
  }
  
  public func invoke() {
    NotificationCenter.default.post(name: Notification.Name(rawValue: GridKitNotifications.ViewAction), object: self, userInfo: userInfo)
  }
  
}
