//
//  ViewController.swift
//  iOS12-Natural-Language-Recognizer
//
//  Created by Hans Knöchel on 05.06.18.
//  Copyright © 2018 Hans Knöchel. All rights reserved.
//

import UIKit
import NaturalLanguage

class ViewController: UIViewController {

  @IBOutlet weak var textView: UITextView!
  
  @IBOutlet weak var resultLabel: UILabel!
}

// MARK: Lifecycle

extension ViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    textView.delegate = self
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    self.textView.becomeFirstResponder()
  }
}

// MARK: UITextViewDelegate

extension ViewController: UITextViewDelegate {

  func textViewDidChange(_ textView: UITextView) {
    guard let text = self.textView.text else { return }
    
    let recognizer = NLLanguageRecognizer()
    recognizer.processString(text)
    resultLabel.text = recognizer.dominantLanguage?.rawValue ?? "Unknown"
  }
  
  func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    if text == "\n" {
      textView.resignFirstResponder()
      return false
    }
    return true
  }
}
