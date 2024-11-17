//
//  ViewController.swift
//  Task6
//
//  Created by Gusev Kirill on 17.11.2024.
//

import UIKit

class ViewController: UIViewController {

    var animator: UIDynamicAnimator!
    var snap: UISnapBehavior!

    private let squareView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupSquareView()
        setupTap()
    }

    private func setupSquareView() {
        view.addSubview(squareView)
        squareView.frame = .init(x: 0, y: 0, width: 80, height: 80)
        squareView.center = view.center
        squareView.layer.cornerRadius = 10
        squareView.layer.masksToBounds = true
        squareView.backgroundColor = .systemBlue
    }
    
    private func setupTap() {
        animator = UIDynamicAnimator(referenceView: view)
        snap = UISnapBehavior(item: squareView, snapTo: squareView.center)
        snap.damping = 1
        animator.addBehavior(snap)
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc private func handleTap(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: view)
        snap.snapPoint = point
    }
}

