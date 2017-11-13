//
//  RecordARProxy.swift
//  MyARKit
//
//  Created by alankong on 2017/11/13.
//  Copyright © 2017年 tuotiansudai. All rights reserved.
//

import Foundation
import ARVideoKit
import ARKit

@objc public enum RecordStatus : Int {
    
    /// The current status of the recorder is unknown.
    case unknown
    
    /// The current recorder is ready to record.
    case readyToRecord
    
    /// The current recorder is recording.
    case recording
    
    /// The current recorder is paused.
    case paused
}

@objc public protocol RecordDelegate : NSObjectProtocol {
    
    /**
     A protocol method that is triggered when a recorder ends recording.
     - parameter path: A `URL` object that returns the video file path.
     - parameter noError: A boolean that returns true when the recorder ends without errors. Otherwise, it returns false.
     */
    func recorder(didEndRecording path: URL, with noError: Bool)
    
    /**
     A protocol method that is triggered when a recorder fails recording.
     - parameter error: An `Error` object that returns the error value.
     - parameter status: A string that returns the reason of the recorder failure in a string literal format.
     */
    func recorder(didFailRecording error: Error?, and status: String)
    
    /**
     A protocol method that is triggered when the application will resign active.
     - parameter status: A `RecordARStatus` object that returns the AR recorder current status.
     
     
     - NOTE: Check [applicationWillResignActive(_:)](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1622950-applicationwillresignactive) for more information.
     */
    func recorder(willEnterBackground status: RecordStatus)
}

@objc public protocol RenderDelegate : NSObjectProtocol {
    
    /**
     A protocol method that is triggered when a frame renders the `ARSCNView` or `ARSKView` content with the device's camera stream.
     - parameter buffer: A `CVPixelBuffer` object that returns the rendered buffer.
     - parameter time: A `CMTime` object that returns the time a buffer was rendered with.
     - parameter rawBuffer: A `CVPixelBuffer` object that returns the raw buffer.
     */
    func frame(didRender buffer: CVPixelBuffer, with time: CMTime, using rawBuffer: CVPixelBuffer)
}

public class RecordARProxy : NSObject, RenderARDelegate, RecordARDelegate {
    
    public var delegate: RecordDelegate?
    
    public var renderAR: RenderDelegate?
    
    var recorder : RecordAR?
    
    public init(ARSceneKit view : ARSCNView) {
        super.init()
        recorder = RecordAR(ARSceneKit: view)
        recorder?.delegate = self;
        recorder?.renderAR = self;
        
        recorder?.inputViewOrientations = [.portrait]
        recorder?.deleteCacheWhenExported = false
    }
    
    public func prepare(_ configuration: ARConfiguration) {
        recorder?.prepare(configuration)
    }
    
    public func rest() {
        recorder?.rest()
    }
    
    public func getStatus() -> RecordStatus {
        if (recorder?.status == .readyToRecord) {
            return RecordStatus.readyToRecord;
        } else if (recorder?.status == .recording) {
            return RecordStatus.recording;
        } else if (recorder?.status == .paused) {
            return RecordStatus.paused;
        }
        
        return RecordStatus.unknown;
    }
    
    public func record() {
        recorder?.record()
    }
    
    public func pause() {
        recorder?.pause()
    }
    
    public func stop() {
        recorder?.stop()
    }
    
    public func record(forDuration duration: TimeInterval, _ finished: ((URL) -> Swift.Void)?) {
        recorder?.record(forDuration: duration, finished)
    }
    
    public func stop(_ finished: ((URL) -> Swift.Void)?) {
        recorder?.stop(finished)
    }
    
}

//MARK: - ARVideoKit Delegate Methods
extension RecordARProxy {
    public func frame(didRender buffer: CVPixelBuffer, with time: CMTime, using rawBuffer: CVPixelBuffer) {
        // Do some image/video processing.
    }
    
    public func recorder(didEndRecording path: URL, with noError: Bool) {
        if noError {
            // Do something with the video path.
        }
    }
    
    public func recorder(didFailRecording error: Error?, and status: String) {
        // Inform user an error occurred while recording.
    }
    
    public func recorder(willEnterBackground status: RecordARStatus) {
        if status == .recording {
            recorder?.stopAndExport()
        }
    }
}
