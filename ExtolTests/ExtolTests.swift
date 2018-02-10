//
//  ExtolTests.swift
//  ExtolTests
//
//  Created by Levi Gemmell on 1/18/18.
//  Copyright © 2018 Bearsnsuch. All rights reserved.
//

import XCTest
@testable import Extol

class ExtolTests: XCTestCase {
    let song = "song"
    var artist: String = "artist"
    var lyrics: String = "lyrics"
    var lyricsURL: String = "lyricsURL"
    var spotifyURI: String = "spotify"
    var scriptureSource: String = "John 15"
    var scriptureText: String = "Blessed Day"
    var devotionText: String = "Great Devotion"
    var season: Season = .wonder
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetDevotionsByArtistWithTheSameArtist() {
        // set up
        let devotionLoader = DevotionLoader()
        let devotion1 = Devotion(withSong: song, artist: artist, lyrics: lyrics, lyricsURL: lyricsURL, spotifyURI: spotifyURI, scriptureSource: scriptureSource, scriptureText: scriptureText, devotionText: devotionText, forSeason: season)
         let devotion2 = Devotion(withSong: song, artist: artist, lyrics: lyrics, lyricsURL: lyricsURL, spotifyURI: spotifyURI, scriptureSource: scriptureSource, scriptureText: scriptureText, devotionText: devotionText, forSeason: season)
        devotionLoader.devotions = [devotion1, devotion2]
        
        // execute
        let devotionsByArtist = devotionLoader.getDevotionsSortedByArtist()
        
        // result
        assert(devotionsByArtist.count == 1)
        assert(devotionsByArtist.first?.count == 2)
    }
    
    func testGetDevotionsByArtistWithDifferentArtistsAlreadyInOrder() {
        // set up
        let devotionLoader = DevotionLoader()
        let artist1 = "a artist"
        let artist2 = "z artist"
        let devotion1 = Devotion(withSong: song, artist: artist1, lyrics: lyrics, lyricsURL: lyricsURL, spotifyURI: spotifyURI, scriptureSource: scriptureSource, scriptureText: scriptureText, devotionText: devotionText, forSeason: season)
        let devotion2 = Devotion(withSong: song, artist: artist2, lyrics: lyrics, lyricsURL: lyricsURL, spotifyURI: spotifyURI, scriptureSource: scriptureSource, scriptureText: scriptureText, devotionText: devotionText, forSeason: season)
        devotionLoader.devotions = [devotion1, devotion2]
        
        // execute
        let devotionsByArtist = devotionLoader.getDevotionsSortedByArtist()
        
        // result
        assert(devotionsByArtist.count == 2)
        assert(devotionsByArtist.first![0].artist == artist1)
        assert(devotionsByArtist.last![0].artist == artist2)
    }
    
    func testGetDevotionsByArtistWithDifferentArtistsNotInOrder() {
        // set up
        let devotionLoader = DevotionLoader()
        let artist1 = "z artist"
        let artist2 = "a artist"
        let devotion1 = Devotion(withSong: song, artist: artist1, lyrics: lyrics, lyricsURL: lyricsURL, spotifyURI: spotifyURI, scriptureSource: scriptureSource, scriptureText: scriptureText, devotionText: devotionText, forSeason: season)
        let devotion2 = Devotion(withSong: song, artist: artist2, lyrics: lyrics, lyricsURL: lyricsURL, spotifyURI: spotifyURI, scriptureSource: scriptureSource, scriptureText: scriptureText, devotionText: devotionText, forSeason: season)
        devotionLoader.devotions = [devotion1, devotion2]
        
        // execute
        let devotionsByArtist = devotionLoader.getDevotionsSortedByArtist()
        
        // result
        assert(devotionsByArtist.count == 2)
        assert(devotionsByArtist.first![0].artist == artist2)
        assert(devotionsByArtist.last![0].artist == artist1)
    }
    
    func testAddDevotionToNewArtistSection_AddWhenItsEmpty() {
        // set up
        let devotionLoader = DevotionLoader()
        var devotionsByArtist = [[Devotion]]()
        let devotion1 = Devotion(withSong: song, artist: artist, lyrics: lyrics, lyricsURL: lyricsURL, spotifyURI: spotifyURI, scriptureSource: scriptureSource, scriptureText: scriptureText, devotionText: devotionText, forSeason: season)
        
        // execute
        devotionLoader.addDevotionToNewArtistSection(devotion: devotion1, devotionsByArtist: &devotionsByArtist)
        
        // result
        assert(devotionsByArtist.first?.first?.artist == artist)
        assert(devotionsByArtist.first?.count == 1)
    }
    
    func testAddDevotionToNewArtistSection_AddWithEarlierArtistAlreadyThere() {
        // set up
        let devotionLoader = DevotionLoader()
        let artist1 = "a artist"
        let artist2 = "z artist"
        
        let devotion1 = Devotion(withSong: song, artist: artist1, lyrics: lyrics, lyricsURL: lyricsURL, spotifyURI: spotifyURI, scriptureSource: scriptureSource, scriptureText: scriptureText, devotionText: devotionText, forSeason: season)
        
        var devotionsByArtist = [[devotion1]]
        
        let devotion2 = Devotion(withSong: song, artist: artist2, lyrics: lyrics, lyricsURL: lyricsURL, spotifyURI: spotifyURI, scriptureSource: scriptureSource, scriptureText: scriptureText, devotionText: devotionText, forSeason: season)
        
        
        // execute
        devotionLoader.addDevotionToNewArtistSection(devotion: devotion2, devotionsByArtist: &devotionsByArtist)
        
        // result
        assert(devotionsByArtist.first?.first?.artist == artist1)
        assert(devotionsByArtist.last?.first?.artist == artist2)
    }
    
    func testAddDevotionToNewArtistSection_AddWithLaterArtistAlreadyThere() {
        // set up
        let devotionLoader = DevotionLoader()
        let artist1 = "z artist"
        let artist2 = "a artist"
        
        let devotion1 = Devotion(withSong: song, artist: artist1, lyrics: lyrics, lyricsURL: lyricsURL, spotifyURI: spotifyURI, scriptureSource: scriptureSource, scriptureText: scriptureText, devotionText: devotionText, forSeason: season)
        
        var devotionsByArtist = [[devotion1]]
        
        let devotion2 = Devotion(withSong: song, artist: artist2, lyrics: lyrics, lyricsURL: lyricsURL, spotifyURI: spotifyURI, scriptureSource: scriptureSource, scriptureText: scriptureText, devotionText: devotionText, forSeason: season)
        
        
        // execute
        devotionLoader.addDevotionToNewArtistSection(devotion: devotion2, devotionsByArtist: &devotionsByArtist)
        
        // result
        assert(devotionsByArtist.first?.first?.artist == artist2)
        assert(devotionsByArtist.last?.first?.artist == artist1)
    }
    
    func testAddDevotionToNewArtistSection_AddToTheMiddle() {
        // set up
        let devotionLoader = DevotionLoader()
        let earlyArtist = "a artist"
        let middleArtist = "f artist"
        let lateArtist = "z artist"
        
        let devotionEarly = Devotion(withSong: song, artist: earlyArtist, lyrics: lyrics, lyricsURL: lyricsURL, spotifyURI: spotifyURI, scriptureSource: scriptureSource, scriptureText: scriptureText, devotionText: devotionText, forSeason: season)
        let devotionLate = Devotion(withSong: song, artist: lateArtist, lyrics: lyrics, lyricsURL: lyricsURL, spotifyURI: spotifyURI, scriptureSource: scriptureSource, scriptureText: scriptureText, devotionText: devotionText, forSeason: season)
        
        var devotionsByArtist = [[devotionEarly],[devotionLate]]
        
        let devotionMiddle = Devotion(withSong: song, artist: middleArtist, lyrics: lyrics, lyricsURL: lyricsURL, spotifyURI: spotifyURI, scriptureSource: scriptureSource, scriptureText: scriptureText, devotionText: devotionText, forSeason: season)
        
        
        // execute
        devotionLoader.addDevotionToNewArtistSection(devotion: devotionMiddle, devotionsByArtist: &devotionsByArtist)
        
        // result
        assert(devotionsByArtist.first?.first?.artist == earlyArtist)
        assert(devotionsByArtist[1].first?.artist == middleArtist)
        assert(devotionsByArtist.last?.first?.artist == lateArtist)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
