//
//  StackViewDataManager.swift
//  GridKit
//
//  Created by Dmitry Ivanenko on 19.09.16.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import UIKit


public class StackViewDataManager {
  
  let stackView: UIStackView
  var containers = [Container]()
  
  public init(stackView: UIStackView) {
    self.stackView = stackView
    
    NotificationCenter.default.addObserver(self, selector: #selector(didReceiveAction), name: NSNotification.Name(rawValue: GridKitNotifications.ViewAction), object: nil)
  }
  
  deinit {
    NotificationCenter.default.removeObserver(self)
  }
  
  @objc func didReceiveAction(_ notification: Notification) {
    guard let action = notification.object as? ViewAction else {
      return
    }
    
    for container in containers {
      if container.view == action.view {
        let _ = container.invoke(.custom(action.key))
      }
    }
  }
  
  public func append(container: Container) {
    containers.append(container)
    container.configure()
    stackView.addArrangedSubview(container.view)
  }
  
  public func append(containers: [Container]) {
    for container in containers {
      append(container: container)
    }
  }
  
  public func clear() {
    containers.removeAll()
    for subview in stackView.arrangedSubviews {
      subview.removeFromSuperview()
    }
  }
  
}
