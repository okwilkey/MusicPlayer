import UIKit
import MediaPlayer

class ViewController: UIViewController {

    
    // Creating the music player for the app.
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
// When button is tapped and the app is authorized to use apple music, it will play music.
    
    @IBAction func genreButtonTapped(_ sender: UIButton) {
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized {
                self.playGenre(genre: sender.currentTitle!)
            }
        }
        
    }
    
    // tapping the stop button will now stop the music player
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    // 
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    
    
    func playGenre(genre: String) {
        
        musicPlayer.stop()
        
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        
        query.addFilterPredicate(predicate)
        
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
    
}

