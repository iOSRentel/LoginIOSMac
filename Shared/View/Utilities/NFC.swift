//
//  NFC.swift
//  LoginIOSMac (iOS)
//
//  Created by Boris Zinovyev on 16.11.2021.
//

import SwiftUI
import CoreNFC

struct NFC: View {
    
    @State var data = ""
    @State var showWrite = false
    
    let holder = "NFC message will display here..."
    
    //  VIEW
    var body: some View {
//        NavigationView {
            GeometryReader { reader in
                VStack(spacing: 30) {
                    ZStack(alignment: .top) {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 4)
                            )
                        
                        Text(self.data.isEmpty ? self.holder : self.data)
                            .foregroundColor(self.data.isEmpty ? .gray :  .black)
                            .padding()
                    }.frame(height: reader.size.height * 0.4)
                    nfcButton(data: self.$data)
                        .frame(height: reader.size.height * 0.07)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    //     WRITE NFC Navigation
                    NavigationLink(destination: writeView(isActive: self.$showWrite), isActive: self.$showWrite) {
                        Button(action: {
                            self.showWrite.toggle()
                        }) {
                            Text("Write NFC-tag")
                                .frame(width: reader.size.width * 0.9, height: reader.size.height * 0.07)
                        }.foregroundColor(.white)
                            .background(Color.black)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                    Spacer()
                }.frame(width: reader.size.width * 0.9)
//                    .navigationBarTitle("NFC data:", displayMode: .large)
                    .padding()
            }
        }
    }
//}



struct Payload {
    var type : RecordType
    var pickerMsg : String
}


// writeView
struct writeView : View {
    
    @State var record = ""
    @State private var selection = 0
    
    @Binding var isActive : Bool
    
    var sessionWrite = NFCSessionWrite()
    var recordType = [Payload(type: .text, pickerMsg: "Text"), Payload(type: .url, pickerMsg: "URL")]
    
    var body : some View {
        Form {
            Section {
                TextField("Message here...", text: self.$record).autocapitalization(.none)
            }
            Section {
                Picker(selection: self.$selection, label: Text("Pick a record type")) {
                    ForEach(0..<self.recordType.count) {
                        Text(self.recordType[$0].pickerMsg)
                    }
                }
            }
            
            Section{
                Button(action: {
                    self.sessionWrite.beginScanning(message: self.record, recordType: self.recordType[selection].type)
                }) {
                    Text("Write")
                    
                }
            }
                .navigationBarTitle("NFC Write")
                .navigationBarItems(leading:
                                        Button(action: {
                    self.isActive.toggle()
                }) {
                    //                HStack(spacing: 5) {
                    //                    Image(systemName: "chevron.left")
                    //                    Text("back")
                    //                }
                }
                )
        }
    }
}

//  WRITE NFC tag
enum RecordType {
    case text, url
}

class NFCSessionWrite : NSObject, NFCNDEFReaderSessionDelegate {
    var session : NFCNDEFReaderSession?
    var message = ""
    var recordType : RecordType = .text
    
    func beginScanning(message: String, recordType : RecordType){
        guard NFCNDEFReaderSession.readingAvailable else {
            print("Scanning not support for this device")
            return
        }
        self.message = message
        self.recordType = recordType
        
        session = NFCNDEFReaderSession(delegate: self, queue: .main, invalidateAfterFirstRead: false)
        session?.alertMessage = "Hold your iPhone near an NFC tag to write message."
        session?.begin()
        
    }
    
    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        //        Do nothing here unless to implement error
        
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        //        Do nothing
    }
    
    func readerSessionDidBecomeActive(_ session: NFCNDEFReaderSession) {
        //       This is to silence console
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetect tags: [NFCNDEFTag]) {
        if tags.count > 1 {
            let retryInterval = DispatchTimeInterval.milliseconds(2000)
            session.alertMessage = "More than 1 tag is detected. Remove all tag and try again."
            DispatchQueue.global().asyncAfter(deadline: .now() + retryInterval) {
                session.restartPolling()
            }
            return
        }
        let tag = tags.first!
        print("Got first tag!")
        session.connect(to: tag) { (error) in
            if error != nil {
                session.alertMessage = "Unable to connect to tag."
                session.invalidate()
                print("Error connect")
                return
            }
            tag.queryNDEFStatus{(NFCNDEFStatus, capacity, error) in
                if error != nil {
                    session.alertMessage = "Unable to query the NFC NDEF tag."
                    session.invalidate()
                    print("Error query tag.")
                    return
                }
                switch NFCNDEFStatus {
                case .notSupported:
                    print("Not support")
                    session.alertMessage = "Tag is not NDEF complaint"
                    session.invalidate()
                case .readWrite:
                    print("Read write")
                    let payLoad : NFCNDEFPayload?
                    switch self.recordType {
                    case .text:
                        guard !self.message.isEmpty else {
                            session.alertMessage = "Empty Data"
                            session.invalidate(errorMessage: "Empty text data")
                            return
                        }
                        
//  Make our payload
                        payLoad = NFCNDEFPayload(format: .nfcWellKnown, type:
                                                "T".data(using: .utf8)!,
                                                 identifier: "Text".data(using: .utf8)!,
                                                 payload: self.message.data(using: .utf8)!)
                        
                    case .url:
//  URL is real?
                        guard let url = URL(string: self.message) else {
                            print("Not a valid URL")
                            session.alertMessage = "Unrecognize URL"
                            session.invalidate(errorMessage: "Data is not a URL")
                            return
                        }
                        
//   Make payload
                        payLoad = NFCNDEFPayload.wellKnownTypeURIPayload(url: url)
                    }
//   Make our massage array
                    let nfcMessage = NFCNDEFMessage(records: [payLoad!])
//   Write a tag
                    tag.writeNDEF(nfcMessage) { (error) in
                        if error != nil {
                            session.alertMessage = "Write NDEF successful."
                            print("Success write: \(error!.localizedDescription)")
                        } else {
                            session.alertMessage = "Write NDEF successful."
                            print("Success write.")
                        }
                        session.invalidate()
                    }
                    
// Lock a tag
                    tag.writeLock(){(error : Error?) in
                    if nil != error{
                        session.alertMessage = "Unable to Lock card"
                        session.invalidate()
                        return
                    }else {
                        session.alertMessage = "Tag has Locked successfuly"
                        session.invalidate()
                        return
                    }
                }

                case .readOnly:
                    print("Read only")
                    session.alertMessage = "Tag is read only."
                    session.invalidate()
                @unknown default:
                    print("Unknown error")
                    session.alertMessage = "Unknown NDEF tag status."
                    session.invalidate()
                }
            }
        }
    }
}

// READ NFC tag
struct nfcButton: UIViewRepresentable {
    @Binding var data : String
    func makeUIView(context: UIViewRepresentableContext<nfcButton>) -> UIButton {
        let button = UIButton()
        button.setTitle("Read NFC-card", for: .normal)
        button.backgroundColor = UIColor.black
        button.addTarget(context.coordinator, action: #selector(context.coordinator.beginScan(_:)), for: .touchUpInside)
        return button
    }
    func updateUIView(_ uiView: UIButton, context: UIViewRepresentableContext<nfcButton>) {
        //        Do nothing
    }
    
    func makeCoordinator() -> nfcButton.Coordinator {
        return Coordinator(data: $data)
    }
    
    class Coordinator : NSObject, NFCNDEFReaderSessionDelegate {
        var session : NFCNDEFReaderSession?
        @Binding var data : String
        
        init(data: Binding<String>) {
            _data = data
        }
        
        @objc func beginScan(_ sender: Any) {
            guard NFCNDEFReaderSession.readingAvailable else {
                print("error: Scanning not support")
                return
            }
            session = NFCNDEFReaderSession(delegate: self, queue: .main, invalidateAfterFirstRead: true)
            session?.alertMessage = "Hold your iPhone near to scan."
            session?.begin()
        }
        
        func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
            
            if let readerError = error as? NFCReaderError {
                if (readerError.code != .readerSessionInvalidationErrorFirstNDEFTagRead) && (readerError.code != .readerSessionInvalidationErrorUserCanceled) {
                    
                    print("Error NFC read: \(readerError.localizedDescription)")
                }
            }
            
            self.session = nil
        }
        
        func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
            guard
                let nfcMess = messages.first,
                let record = nfcMess.records.first,
                record.typeNameFormat == .absoluteURI || record.typeNameFormat == .nfcWellKnown,
                let payload = String(data: record.payload,encoding: .utf8)
            else {
                return
            }
            print(payload)
            self.data = payload
        }
    }
}
