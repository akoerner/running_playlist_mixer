# Running Playlist Mixer
Command line tool for mixing endurance running playlists

# Prerequisites 

requires yt-dlp installed

# Usage
1. create a tab separates playlist file similar to Half_Marathon_Mix.txt 
2. Update the environment variable in mix_playlist.sh to match your playlist name
3. Run the shell script
```bash 
bash mix_playlist.sh
```

The length of the playlist will be calculated and displayed. 
The result will be a playlist directory with a fixed order dictated in your input
text file.
