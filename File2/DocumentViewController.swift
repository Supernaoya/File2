//
//  DocumentViewController.swift
//  File2
//
//  Created by 登坂直弥 on 2017/10/25.
//  Copyright © 2017年 super.naoya. All rights reserved.
//

import UIKit

class DocumentViewController: UIViewController {
    
    @IBAction func selectFile(_ sender: Any) {
    }
    @IBOutlet weak var documentNameLabel: UILabel!
    
    var document: UIDocument?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Access the document
        document?.open(completionHandler: { (success) in
            if success {
                // Display the content of the document, e.g.:
                self.documentNameLabel.text = self.document?.fileURL.lastPathComponent
            } else {
                // Make sure to handle the failed import appropriately, e.g., by presenting an error message to the user.
            }
        })
    }
    
    @IBAction func dismissDocumentViewController() {
        dismiss(animated: true) {
            self.document?.close(completionHandler: nil)
        }
    }
}
