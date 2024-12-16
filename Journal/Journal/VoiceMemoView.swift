//
//  voice recording.swift
//  Journal
//
//  Created by Sakshi Anil Sindgi on 12/12/24.
//

import SwiftUI

struct VoiceMemoView: View {
    @State private var isRecording = false
    @State private var playbackTime: Double = 0.0
    @State private var totalDuration: Double = 5.0 // Example duration
    
    var body: some View {
        NavigationView {
            VStack {
                Text("All Recordings")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.top, 20)
                
                Spacer()
                
                // Recording item
                VStack(alignment: .leading, spacing: 10) {
                    Text("Demo no. 1")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    HStack {
                        Slider(value: $playbackTime, in: 0...totalDuration)
                            .accentColor(.white)
                        
                        Text("-\(Int(totalDuration - playbackTime))")
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                    
                    HStack {
                        Button(action: {}) {
                            Image(systemName: "waveform")
                                .font(.title2)
                                .foregroundColor(.blue)
                        }
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Image(systemName: "play.fill")
                                .font(.title)
                                .foregroundColor(.blue)
                        }
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Image(systemName: "trash.fill")
                                .font(.title2)
                                .foregroundColor(.blue)
                        }
                    }
                }
                .padding()
                .background(Color.black.opacity(0.8))
                .cornerRadius(10)
                .padding(.horizontal)
                
                Spacer()
                
                // Recording visualization
                WaveformView()
                    .frame(height: 100)
                
                // Record button
                Button(action: {
                    isRecording.toggle()
                }) {
                    Circle()
                        .fill(isRecording ? Color.gray : Color.red)
                        .frame(width: 70, height: 70)
                }
                .padding(.bottom, 20)
                
                Spacer()
                
                // Bottom tab bar
                HStack {
                    Spacer()
                    Image(systemName: "house.fill")
                        .font(.title2)
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "square.and.pencil")
                        .font(.title2)
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "waveform")
                        .font(.title2)
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "gearshape.fill")
                        .font(.title2)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding()
                .background(Color.black.opacity(0.9))
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Start recording") {}
                        .foregroundColor(.blue)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {}
                        .foregroundColor(.blue)
                }
            }
        }
    }
}

struct WaveformView: View {
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 2) {
                ForEach(0..<Int(geometry.size.width / 6), id: \.self) { _ in
                    RoundedRectangle(cornerRadius: 2)
                        .fill(Color.white)
                        .frame(width: 4, height: CGFloat.random(in: 10...50))
                }
            }
        }
    }
}

struct VoiceMemoView_Previews: PreviewProvider {
    static var previews: some View {
        VoiceMemoView()
    }
}

