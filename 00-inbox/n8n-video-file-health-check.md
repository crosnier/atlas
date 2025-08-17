 automatically check the health of video files added to media library, regardless of subdirectory and format.
	1. monitor for new video format file in media/*
	2. identiy file name and path
	3. run through code check
	4. return:
		1. health check results
		2. basic video file metadata – file type, bitrate, etc etc.
	5. add entry to logfile _?where?_
	6. post to discord (or slack?)

sample ffmpeg command:
```
ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "/path/to/video.mp4"
```

### **🔍 Command Breakdown**
1. **ffprobe**
    - A command-line tool that comes with ffmpeg, used to inspect media files (e.g., get metadata, stream info, duration, codecs).  
2. **-v error**
    - Sets verbosity to **only show errors**.
    - This hides warnings and informational messages, so output is cleaner.  
3. **-show_entries format=duration**
    - Tells ffprobe to extract just the **duration** of the file (in seconds).
    - It’s pulling this from the **format-level metadata** (not per stream).  
4. **-of default=noprint_wrappers=1:nokey=1**
    - Sets the **output format**:
        - noprint_wrappers=1: removes section headers like [FORMAT]
        - nokey=1: removes key names (like duration=)
    - Result: Just raw duration value like 55.123456
5. **"/path/to/video.mp4"**
    - The **path to the video file** being inspected.        
    - Replace this with your actual file path.  


---

### **🧪 Example Output**

If the video is good:

```
55.123456
```

If the video is corrupt or unreadable:

- No output
    
- Or an error, depending on what’s wrong
    

---

### **✅ Use Case in n8n:**

- Use this to **verify if a file is playable** (if ffprobe can extract duration, it’s probably not corrupt).
    
- You can **branch logic** in n8n:
    
    - If output exists → file is good
        
    - If empty or error → file is corrupt or unreadable