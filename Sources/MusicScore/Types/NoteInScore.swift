//
//  NoteInScore.swift
//  

import Foundation
import MusicSymbol

/// represent a note in score , has its position info(beginBeat) , and its performance info(press and release velocity)
public struct NoteInScore {
    
    public init(note: Note, tempo: Tempo,
                pressVelocity: UInt8, releaseVelocity: UInt8,
                beginBeat: MusicTimeStamp) {
        self.note = note
        self.tempo = tempo
        self.pressVelocity = pressVelocity
        self.releaseVelocity = releaseVelocity
        self.beginBeat = beginBeat
    }
    
    /// note
    public var note: Note
    
    /// tempo of this note being played
    public var tempo: Tempo

    /// press velocity
    public var pressVelocity: UInt8

    /// release velocity
    public var releaseVelocity: UInt8

    /// position in time, measured in beats, begin
    public var beginBeat: MusicTimeStamp
}

extension NoteInScore {
    
    /// the duration for the note,
    public var phyDuration: PhysicalDuration {
        return tempo.duration(of: note)
    }
    
    /// beats
    public var beats: MusicDuration {
        return tempo.beats(of: note)
    }
    
    /// note name
    public var noteName: String {
        return note.pitch.description
    }
    
    /// end beat
    public var endBeat: MusicTimeStamp {
        return beginBeat + beats
    }
    
    public var pitch: Pitch {
        return note.pitch
    }
}

extension NoteInScore: CustomStringConvertible {
    public var description: String {
        return String(format: "[%.3f-%.3f)", beginBeat, endBeat) + " "
            + "🎵\(note)" + " beats:\(beats.as3DigitString) duration:\(phyDuration.as3DigitString)" + " "
            + "⬇️\(pressVelocity) ⬆️\(releaseVelocity)"
    }
}

