# AuctionEar Project Plan and Requirements

# Auction Audio Processing — Project Plan & Requirements

## Overview

This project is designed to ingest and process audio recordings from live auctions, with the goal of cleaning up the audio, transcribing speech, detecting target keywords, and extracting and saving relevant clips. The system will evolve from a prototype Python script into a background service running on Windows.

---

## 🧱 Project Objectives

1. **Improve Audio Quality** – Remove background noise and clarify spoken words.
2. **Transcribe Speech** – Convert spoken auctioneer dialogue into text.
3. **Keyword Detection** – Extract and log specific auction terms or item references.
4. **Clip Extraction** – Save audio clips that contain key terms.
5. **Directory Monitoring** – Automatically process files placed into a specific folder.
6. **Windows Service Packaging** – Deploy as a background service on Windows machines.

---

## 🔁 End-to-End Workflow

1. **Input MP3 Audio File**
2. **Audio Cleaning Pipeline**
    - Remove background noise
    - Isolate human speech
    - Enhance vocal clarity
3. **(Optional) Audio Playback Adjustments**
    - Slow down playback to improve transcription accuracy
4. **Speech-to-Text Transcription**
    - Generate full transcript of spoken audio
5. **Keyword Extraction**
    - Match pre-defined target terms (e.g., `"sold"`, `"lot"`, `"dollars"`, `"number"`)
    - Store matches in JSON or spreadsheet (CSV/XLSX)
6. **Audio Clip Extraction**
    - Save segments around detected keywords as separate `.mp3` or `.wav` files
    - Use a naming convention like: `auction_clip_lot123_sold_20250707.mp3`
7. **Directory Watch Mode (Prototype Phase 2)**
    - Watch a user-specified folder for new MP3 files
    - Process each new file automatically
8. **Packaging (Final Phase)**
    - Package into an executable/scriptable Windows background service
    - Ensure minimal resource usage, configurable settings

---

## 🛠 Feature-Level Requirements

### 1. **Audio Input Handling**
- Accept `.mp3` (and eventually `.wav`) format
- Validate and normalize file input

### 2. **Noise Reduction & Enhancement**
- Use tools like `noisereduce`, `pydub`, or pretrained deep learning models
- Remove fan noise, reverb, crowd murmur, etc.
- Preserve and amplify human voice characteristics

### 3. **Voice Clarification**
- Apply filters or ML-enhanced clarity boosts (e.g. [Demucs](https://github.com/facebookresearch/demucs), [Whisper-enhancer])

### 4. **Speech Transcription**
- Use Whisper (OpenAI) or similar local/offline transcription engines
- Output `.txt` and `.json` transcripts with word-level timestamps

### 5. **Keyword Detection**
- Configurable keyword list (stored in `keywords.json`)
- Log:
  - Matched word
  - Timestamp
  - Context window (±5 seconds)
- Output to `.json` and `.csv`

### 6. **Clip Extraction**
- Extract ±5 seconds around keyword
- Save with filename structure:

### 7. **Directory Monitoring**
- Optional mode: monitor a specific folder using watchdog
- When file is added:
  - Run full processing pipeline
  - Save output clips/transcripts to `output/` directory

### 8. **Windows Service Integration**
- Bundle dependencies (possibly with PyInstaller)
- Configure `.exe` or script to run as Windows background process
- Add support for system tray icon (optional for future UX)

---

## 🧪 Prototype Development Phases

| Phase | Goal |
|-------|------|
| **Phase 1** | Scripted prototype run on local machine via command line |
| **Phase 2** | Add automatic keyword extraction and clip creation |
| **Phase 3** | Enable folder watching and batch processing |
| **Phase 4** | Package and deploy as a background Windows service |

---

## 📁 Directory Structure (Proposed)

auction-audio-processing/
│
├── input/                 # Source MP3 files
├── output/
│   ├── transcripts/       # Full .txt and .json transcriptions
│   ├── clips/             # Extracted audio clips
│   └── logs/              # Keyword detections, processing reports
│
├── config/
│   └── keywords.json      # List of terms to extract
│
├── process-audio.py       # Core pipeline
├── monitor-directory.py   # Watchdog loop
├── requirements.txt
└── README.md

---

## 🧠 Future Enhancements

- Add GUI for manual clip review
- Integrate with auction database for auto-tagging of items
- Speaker diarization (if multiple speakers present)
- Cloud-based scalability (optional)

---

## 📌 Next Step

Begin Phase 1 development:
- Prototype a Python script to load an MP3 file, clean the audio, and transcribe it using OpenAI Whisper or a Whisper wrapper.