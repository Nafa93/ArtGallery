//
//  DefaultMotionManager.swift
//  ArtGallery (iOS)
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 24/01/2022.
//

import Foundation
import CoreMotion

final class DefaultMotionManager {
    private var manager: CMMotionManager = {
        let manager = CMMotionManager()
        manager.gyroUpdateInterval = 1.0 / 60.0
        return manager
    }()
    
    private var timer: Timer?
    
    func startGyros(onUpdatedReceived: ((Double) -> Void)?) {
        guard manager.isGyroAvailable else { return }
        
        manager.startGyroUpdates()

        self.timer = Timer(fire: Date(), interval: (1.0/60.0), repeats: true, block: { (timer) in
            if let data = self.manager.gyroData {
                let zAxis = data.rotationRate.z

                onUpdatedReceived?(self.rad2deg(zAxis))
            }
        })

        guard let timer = timer else {
            return
        }

        RunLoop.current.add(timer, forMode: RunLoop.Mode.default)
    }
    
    func stopGyros() {
        manager.stopGyroUpdates()
        timer?.invalidate()
    }
    
    private func rad2deg(_ number: Double) -> Double {
        return number * 180 / .pi
    }
}
